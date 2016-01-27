/**
 * @ngdoc module
 * @name  SampleBastionPlugin.sample-models
 *
 * @description
 *    Module for sample models
 */
angular.module('SampleBastionPlugin.sample-models', [
    'ngResource',
    'ui.router',
    'Bastion',
    'Bastion.components',
    'Bastion.components.formatters'
]);

/**
 * @ngdoc object
 * @name SampleBastionPlugin.sample-models.config
 *
 * @requires $stateProvider
 *
 * @description
 *   Used for sample models level configuration such as setting up the ui state machine.
 */
angular.module('SampleBastionPlugin.sample-models').config(['$stateProvider', function ($stateProvider) {
    $stateProvider.state('sample-models', {
        abstract: true,
        controller: 'SampleModelsController',
        templateUrl: 'sample-models/views/sample-models.html'
    });

    $stateProvider.state('sample-models.index', {
        url: '/sample_models',
        permission: 'view_sample_models',
        views: {
            'table': {
                templateUrl: 'sample-models/views/sample-models-table-full.html'
            }
        }
    })
    .state('sample-models.new', {
        url: '/sample_models/new',
        permission: 'create_sample_models',
        collapsed: true,
        views: {
            'table': {
                templateUrl: 'sample-models/views/sample-models-table-collapsed.html'
            },
            'action-panel': {
                controller: 'NewSampleModelController',
                templateUrl: 'sample-models/new/views/sample-model-new.html'
            }
        }
    });

    $stateProvider.state('sample-models.details', {
        abstract: true,
        url: '/sample_models/:sampleModelId',
        permission: 'view_sample_models',
        collapsed: true,
        views: {
            'table': {
                templateUrl: 'sample-models/views/sample-models-table-collapsed.html'
            },
            'action-panel': {
                controller: 'SampleModelDetailsController',
                templateUrl: 'sample-models/details/views/sample-model-details.html'
            }
        }
    })
    .state('sample-models.details.info', {
        url: '/info',
        permission: 'view_sample_models',
        collapsed: true,
        controller: 'SampleModelDetailsInfoController',
        templateUrl: 'sample-models/details/views/sample-model-info.html'
    });
}]);
