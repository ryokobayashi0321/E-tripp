// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "jquery"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap/dist/js/bootstrap"
require("@nathanvda/cocoon")



Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on("turbolinks:load", function () {
    function filterTableRows() {
        const value = $(this).val().toLowerCase();
        $("#language-tbody tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    }

    $("#language-search").on("input", filterTableRows);
});
