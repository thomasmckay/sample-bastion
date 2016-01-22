/**
 * @ngdoc object
 * @name  SampleBastionPlugin.samples.controller:SampleDetailsController
 *
 * @requires $scope
 * @requires $state
 * @requires $q
 * @requires translate
 * @requires Sample
 *
 * @description
 *   Provides the functionality for the sample details action pane.
 */
angular.module('SampleBastionPlugin.samples').controller('SampleDetailsController',
    ['$scope', '$state', '$q', 'translate', 'Sample',
    function ($scope, $state, $q, translate, Sample) {
        $scope.successMessages = [];
        $scope.errorMessages = [];

        if ($scope.sample) {
            $scope.panel = {loading: false};
        } else {
            $scope.panel = {loading: true};
        }

        $scope.sample = Sample.get({id: $scope.$stateParams.sampleId}, function (sample) {
            $scope.$broadcast('sample.loaded', sample);
            $scope.panel.loading = false;
        });

        $scope.save = function (sample) {
            var deferred = $q.defer();

            sample.$update(function (response) {
                deferred.resolve(response);
                $scope.successMessages.push(translate('Sample updated'));
                $scope.table.replaceRow(response);
            }, function (response) {
                deferred.reject(response);
                $scope.errorMessages.push(translate("An error occurred saving the Sample: ") + response.data.displayMessage);
            });
            return deferred.promise;
        };

        $scope.setSample = function (sample) {
            $scope.sample = sample;
        };

        $scope.removeSample = function (sample) {
            var id = sample.id;

            sample.$delete(function () {
                $scope.removeRow(id);
                $scope.transitionTo('samples.index');
                $scope.successMessages.push(translate('Sample removed.'));
            }, function (response) {
                $scope.errorMessages.push(translate("An error occurred removing the Sample: ") + response.data.displayMessage);
            });
        };
    }]
);
