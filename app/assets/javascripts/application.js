// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


function checkButton(classname)
{
    var name = classname[0].name.slice(3)
    console.log(name)
    var chkBoxs = document.getElementById(classname[0].name);
        if (chkBoxs.checked){
            if(name == "All"){
                var labels = document.getElementsByClassName("col-btn-label");
                var checkboxes = document.getElementsByClassName("col-btn");
                for(let i = 0 ; i < labels.length ; i++){
                    checkboxes[i].checked = true;
                    toggleState(labels[i],true);
                }
            }
            else{
                console.log(document.getElementsByName(name))
                document.getElementsByName(name)[0].className = "btn btn-secondary col-btn-label";
            }
        }
        else{
            if(name == "All"){
                var labels = document.getElementsByClassName("col-btn-label");
                var checkboxes = document.getElementsByClassName("col-btn");
                for(let i = 0;i < checkboxes.length;i++){
                    checkboxes[i].checked = false;
                    toggleState(labels[i],false);
                }
            }
            else{
                console.log(document.getElementsByName(name))
                document.getElementsByName(name)[0].className = "btn btn-outline-secondary col-btn-label";
            }
        }
}

function toggleState(label,state){
     if (state){
            label.className = "btn btn-secondary col-btn-label";
        }
        else
            label.className = "btn btn-outline-secondary col-btn-label";
}