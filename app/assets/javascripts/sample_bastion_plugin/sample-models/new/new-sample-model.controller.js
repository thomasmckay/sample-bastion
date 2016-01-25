/**
 * @ngdoc object
 * @name  SampleBastionPlugin.sample-models.controller:NewSampleModelController
 *
 * @requires $scope
 * @requires $q
 * @requires FormUtils
 * @requires SampleModel
 *
 * @description
 *   Controls the creation of an empty Sample Model object for use by sub-controllers.
 */
angular.module('SampleBastionPlugin.sample-models').controller('NewSampleModelController',
    ['$scope', '$q', 'FormUtils', 'SampleModel',
    function ($scope, $q, FormUtils, SampleModel) {

        function success(response) {
            $scope.table.addRow(response);
            $scope.transitionTo('sample-models.details.info', {sampleModelId: $scope.sampleModel.id});
        }

        function error(response) {
            $scope.working = false;
            angular.forEach(response.data.errors, function (errors, field) {
                $scope.sampleModelForm[field].$setValidity('server', false);
                $scope.sampleModelForm[field].$error.messages = errors;
            });
        }

        $scope.sampleModel = $scope.sampleModel || new SampleModel();

        $scope.panel = {loading: false};

        $scope.save = function (sampleModel) {
            sampleModel.$save(success, error);
        };

    }]
);
