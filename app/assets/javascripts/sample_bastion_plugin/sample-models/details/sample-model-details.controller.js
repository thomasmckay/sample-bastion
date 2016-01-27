/**
 * @ngdoc object
 * @name  SampleBastionPlugin.sample-models.controller:SampleModelDetailsController
 *
 * @requires $scope
 * @requires $state
 * @requires $q
 * @requires translate
 * @requires SampleModel
 *
 * @description
 *   Provides the functionality for the sample model details action pane.
 */
angular.module('SampleBastionPlugin.sample-models').controller('SampleModelDetailsController',
    ['$scope', '$state', '$q', 'translate', 'SampleModel',
    function ($scope, $state, $q, translate, SampleModel) {
        $scope.successMessages = [];
        $scope.errorMessages = [];

        if ($scope.sampleModel) {
            $scope.panel = {loading: false};
        } else {
            $scope.panel = {loading: true};
        }

        $scope.sampleModel = SampleModel.get({id: $scope.$stateParams.sampleModelId}, function (sampleModel) {
            $scope.$broadcast('sampleModel.loaded', sampleModel);
            $scope.panel.loading = false;
        });

        $scope.save = function (sampleModel) {
            var deferred = $q.defer();

            sampleModel.$update(function (response) {
                deferred.resolve(response);
                $scope.successMessages.push(translate('Sample Model updated'));
                $scope.table.replaceRow(response);
            }, function (response) {
                deferred.reject(response);
                $scope.errorMessages.push(translate("An error occurred saving the Sample Model: ") + response.data.displayMessage);
            });
            return deferred.promise;
        };

        $scope.setSampleModel = function (sampleModel) {
            $scope.sampleModel = sampleModel;
        };

        $scope.removeSampleModel = function (sampleModel) {
            var id = sampleModel.id;

            sampleModel.$delete(function () {
                $scope.removeRow(id);
                $scope.transitionTo('sample-models.index');
                $scope.successMessages.push(translate('Sample Model removed.'));
            }, function (response) {
                $scope.errorMessages.push(translate("An error occurred removing the Sample Model: ") + response.data.displayMessage);
            });
        };
    }]
);
