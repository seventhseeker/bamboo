TinyCore.AMD.define("dropdown",[],function(){return{oOpened:!1,onStart:function(){var a=oTools.getDataModules("dropdown"),b=this;b.bindClickOutside(),$(a).each(function(){var a=this;$(".navigation-dropdown > a",a).bind("click",function(c){c.preventDefault(),b.hideDropdowns(a,this),b.slideToggle(this)})}),oTools.trackModule("JS_Libraries","call","dropdown")},bindClickOutside:function(){var a=this;$(document).bind("click",function(b){b.target!=a.oOpened&&"A"!==b.target.nodeName&&a.hideDropdowns()})},hideDropdowns:function(a,b){$(".navigation-dropdown ul",a).each(function(){var a=void 0!==b?b.href.split("#")[1]:"";a!=this.id&&(this.style.display="none")}),this.oOpened=!1},slideToggle:function(a){var b=a.href;-1!==b.indexOf("#")&&($(document.getElementById(b.split("#")[1])).slideToggle("fast"),this.oOpened=a)}}});