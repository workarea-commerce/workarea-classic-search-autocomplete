/**
 * @namespace WORKAREA.searchFields
 */
WORKAREA.registerModule('searchFields', (function () {
    'use strict';

    var getSource = function (request, response) {
            var endpoint = WORKAREA.routes.storefront.searchesPath();

            $.getJSON(endpoint, { q: request.term }, function (data) {
                response(data.results);
            });
        },

        openSelected = function (event, ui) {
            if (ui.item.type === "Products") {
                WORKAREA.analytics.fireCallback(
                    'productClick',
                    ui.item.analytics
                );
            }

            if (WORKAREA.analytics.domEventsDisabled()) { return; }
            window.location = ui.item.url;
        },

        /**
         * iOS touch devices treat touch events as mouseenter unless there is no
         * change in the UI, like a menu-selected state. By unbinding the
         * mouseenter event we force those devices to treat the touch event as a
         * click. This prevents the user having to tap twice to open a search
         * autocomplete result.
         */
        openOnTouchDevices = function () {
            $('.ui-autocomplete').off('mouseenter');
        },

        getConfig = function () {
            var config = WORKAREA.config.searchFieldsAutocomplete || {
                minLength: 2
            };

            return _.assign({}, config, {
                source: getSource,
                select: openSelected,
                open: openOnTouchDevices
            });
        },

        /**
         * Queries the DOM for either a `data-search-field` or
         * `[id=storefront_search] attribute to hook onto, selecting the first
         * that is found, before initializing the customized jQuery UI
         * Autocomplete method `categorizedAutocomplete`.
         *
         * @method
         * @name init
         * @memberof WORKAREA.searchFields
         */
        init = function ($scope) {
            $('[data-search-field], #storefront_search', $scope)
                .first()
                .categorizedAutocomplete(getConfig());
        };

    return {
        init: init
    };
}()));
