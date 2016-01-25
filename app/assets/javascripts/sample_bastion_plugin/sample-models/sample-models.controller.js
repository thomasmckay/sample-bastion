/**
 * @ngdoc object
 * @name  SampleBastionPlugin.sample-models.controller:SampleModelsController
 *
 * @requires $scope
 * @requires $location
 * @requires Nutupane
 * @requires SampleModel
 *
 * @description
 *   Provides the functionality specific to Sample Models for use with the Nutupane UI pattern.
 *   Defines the columns to display and the transform function for how to generate each row
 *   within the table.
 */
angular.module('SampleBastionPlugin.sample-models').controller('SampleModelsController',
    ['$scope', '$location', 'Nutupane', 'SampleModel',
    function ($scope, $location, Nutupane, SampleModel) {

        var params = {
            'search': $location.search().search || "",
            'sort_by': 'name',
            'sort_order': 'ASC',
            'paged': true
        };

        var nutupane = new Nutupane(SampleModel, params);
        $scope.table = nutupane.table;
        $scope.removeRow = nutupane.removeRow;
        $scope.controllerName = 'sample_bastion_plugin_sample_models';

        $scope.table.closeItem = function () {
            $scope.transitionTo('sample-models.index');
        };
    }]
);
