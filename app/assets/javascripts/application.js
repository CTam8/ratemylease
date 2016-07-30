// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery-1.11.0.min.js
//= require jquery.leanModal.min.js
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

var $j = jQuery.noConflict();
$j("#modal_trigger").leanModal({
        top: 100,
        overlay: 0.6,
        closeButton: ".modal_close"
});

$j(function() {
        // Calling Login Form
        $j("#login_form").click(function() {
                $j(".social_login").hide();
                $j(".user_login").show();
                return false;
        });

        // Calling Register Form
        $j("#register_form").click(function() {
                $j(".social_login").hide();
                $j(".user_register").show();
                $j(".header_title").text('Register');
                return false;
        });

        // Going back to Social Forms
        $j(".back_btn").click(function() {
                $j(".user_login").hide();
                $j(".social_login").show();
                $j(".header_title").text('Login');
                return false;
        });
});
