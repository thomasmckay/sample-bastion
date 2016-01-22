/**
 * @ngdoc module
 * @name  SampleBastionPlugin.samples
 *
 * @description
 *    Module for samples
 */
angular.module('SampleBastionPlugin.samples', [
    'ngResource',
    'ui.router',
    'Bastion',
    'Bastion.components',
    'Bastion.components.formatters'
]);

/**
 * @ngdoc object
 * @name SampleBastionPlugin.samples.config
 *
 * @requires $stateProvider
 *
 * @description
 *   Used for samples level configuration such as setting up the ui state machine.
 */
angular.module('SampleBastionPlugin.samples').config(['$stateProvider', function ($stateProvider) {
    $stateProvider.state('samples', {
        abstract: true,
        controller: 'SamplesController',
        templateUrl: 'samples/views/samples.html'
    });

    $stateProvider.state('samples.index', {
        url: '/samples',
        permission: 'view_samples',
        views: {
            'table': {
                templateUrl: 'samples/views/samples-table-full.html'
            }
        }
    })
    .state('samples.new', {
        url: '/samples/new',
        permission: 'create_samples',
        collapsed: true,
        views: {
            'table': {
                templateUrl: 'samples/views/samples-table-collapsed.html'
            },
            'action-panel': {
                controller: 'NewSampleController',
                templateUrl: 'samples/new/views/sample-new.html'
            }
        }
    });

    $stateProvider.state('samples.details', {
        abstract: true,
        url: '/samples/:sampleId',
        permission: 'view_samples',
        collapsed: true,
        views: {
            'table': {
                templateUrl: 'samples/views/samples-table-collapsed.html'
            },
            'action-panel': {
                controller: 'SampleDetailsController',
                templateUrl: 'samples/details/views/sample-details.html'
            }
        }
    })
    .state('samples.details.info', {
        url: '/info',
        permission: 'view_samples',
        collapsed: true,
        controller: 'SampleDetailsInfoController',
        templateUrl: 'samples/details/views/sample-info.html'
    });
}]);
