/**
 * @ngdoc object
 * @name  SampleBastionPlugin.samples.controller:NewSampleController
 *
 * @requires $scope
 * @requires $q
 * @requires FormUtils
 * @requires Sample
 *
 * @description
 *   Controls the creation of an empty Sample object for use by sub-controllers.
 */
angular.module('SampleBastionPlugin.samples').controller('NewSampleController',
    ['$scope', '$q', 'FormUtils', 'Sample',
    function ($scope, $q, FormUtils, Sample) {

        function success(response) {
            $scope.table.addRow(response);
            $scope.transitionTo('samples.details.info', {sampleId: $scope.sample.id});
        }

        function error(response) {
            $scope.working = false;
            angular.forEach(response.data.errors, function (errors, field) {
                $scope.sampleForm[field].$setValidity('server', false);
                $scope.sampleForm[field].$error.messages = errors;
            });
        }

        $scope.sample = $scope.sample || new Sample();

        $scope.panel = {loading: false};

        $scope.save = function (sample) {
            sample.$save(success, error);
        };

    }]
);
