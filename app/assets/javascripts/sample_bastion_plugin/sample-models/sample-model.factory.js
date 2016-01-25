/**
 * @ngdoc service
 * @name  SampleBastionPlugin.sample-models.factory:SampleModel
 *
 * @requires BastionResource
 *
 * @description
 *   Provides a BastionResource for a sample model or list of sample models.
 */
angular.module('SampleBastionPlugin.sample-models').factory('SampleModel',
    ['BastionResource', function (BastionResource) {

        return BastionResource('/sample_bastion_plugin/api/v2/sample_models/:id/:action', {id: '@id'}, {
            update: { method: 'PUT'},
            autocomplete: {method: 'GET', isArray: true, params: {id: 'auto_complete_search'}}
        });

    }]
);
