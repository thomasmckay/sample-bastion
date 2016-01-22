/**
 * @ngdoc object
 * @name  SampleBastionPlugin.samples.controller:SamplesController
 *
 * @requires $scope
 * @requires $location
 * @requires Nutupane
 * @requires Sample
 *
 * @description
 *   Provides the functionality specific to Samples for use with the Nutupane UI pattern.
 *   Defines the columns to display and the transform function for how to generate each row
 *   within the table.
 */
angular.module('SampleBastionPlugin.samples').controller('SamplesController',
    ['$scope', '$location', 'Nutupane', 'Sample',
    function ($scope, $location, Nutupane, Sample) {

        var params = {
            'search': $location.search().search || "",
            'sort_by': 'name',
            'sort_order': 'ASC',
            'paged': true
        };

        var nutupane = new Nutupane(Sample, params);
        $scope.table = nutupane.table;
        $scope.removeRow = nutupane.removeRow;
        $scope.controllerName = 'sample_bastion_plugin_samples';

        $scope.table.closeItem = function () {
            $scope.transitionTo('samples.index');
        };
    }]
);
