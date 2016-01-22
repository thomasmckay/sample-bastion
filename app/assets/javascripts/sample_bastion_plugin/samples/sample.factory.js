/**
 * @ngdoc service
 * @name  SampleBastionPlugin.samples.factory:Sample
 *
 * @requires BastionResource
 *
 * @description
 *   Provides a BastionResource for sample or list of samples.
 */
angular.module('SampleBastionPlugin.samples').factory('Sample',
    ['BastionResource', function (BastionResource) {

        return BastionResource('/sample_bastion_plugin/api/v2/samples/:id/:action', {id: '@id'}, {
            update: { method: 'PUT'},
            autocomplete: {method: 'GET', isArray: true, params: {id: 'auto_complete_search'}}
        });

    }]
);
