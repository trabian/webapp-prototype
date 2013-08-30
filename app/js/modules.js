;(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
(function() {
  "use strict";
  var shout, ssshh;

  shout = require("./my_library/shout").shout;

  ssshh = require("./my_library/ssshh").ssshh;

  exports.shout = shout;

  exports.ssshh = ssshh;

}).call(this);

},{"./my_library/shout":2,"./my_library/ssshh":3}],2:[function(require,module,exports){
(function() {
  "use strict";
  var shout;

  shout = function(s) {
    return s.toUpperCase();
  };

  exports.shout = shout;

}).call(this);

},{}],3:[function(require,module,exports){
(function() {
  "use strict";
  var ssshh;

  ssshh = function(s) {
    return s.toLowerCase();
  };

  exports.ssshh = ssshh;

}).call(this);

},{}]},{},[1,2,3])
//@ sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlcyI6WyIvVXNlcnMvbWF0dGRlYW4vZGV2L2xlYXJuaW5nL2dydW50L3dlYmFwcC8udG1wL2pzL215X2xpYnJhcnkuanMiLCIvVXNlcnMvbWF0dGRlYW4vZGV2L2xlYXJuaW5nL2dydW50L3dlYmFwcC8udG1wL2pzL215X2xpYnJhcnkvc2hvdXQuanMiLCIvVXNlcnMvbWF0dGRlYW4vZGV2L2xlYXJuaW5nL2dydW50L3dlYmFwcC8udG1wL2pzL215X2xpYnJhcnkvc3NzaGguanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IjtBQUFBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FDYkE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQ1hBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbigpIHtcbiAgXCJ1c2Ugc3RyaWN0XCI7XG4gIHZhciBzaG91dCwgc3NzaGg7XG5cbiAgc2hvdXQgPSByZXF1aXJlKFwiLi9teV9saWJyYXJ5L3Nob3V0XCIpLnNob3V0O1xuXG4gIHNzc2hoID0gcmVxdWlyZShcIi4vbXlfbGlicmFyeS9zc3NoaFwiKS5zc3NoaDtcblxuICBleHBvcnRzLnNob3V0ID0gc2hvdXQ7XG5cbiAgZXhwb3J0cy5zc3NoaCA9IHNzc2hoO1xuXG59KS5jYWxsKHRoaXMpO1xuIiwiKGZ1bmN0aW9uKCkge1xuICBcInVzZSBzdHJpY3RcIjtcbiAgdmFyIHNob3V0O1xuXG4gIHNob3V0ID0gZnVuY3Rpb24ocykge1xuICAgIHJldHVybiBzLnRvVXBwZXJDYXNlKCk7XG4gIH07XG5cbiAgZXhwb3J0cy5zaG91dCA9IHNob3V0O1xuXG59KS5jYWxsKHRoaXMpO1xuIiwiKGZ1bmN0aW9uKCkge1xuICBcInVzZSBzdHJpY3RcIjtcbiAgdmFyIHNzc2hoO1xuXG4gIHNzc2hoID0gZnVuY3Rpb24ocykge1xuICAgIHJldHVybiBzLnRvTG93ZXJDYXNlKCk7XG4gIH07XG5cbiAgZXhwb3J0cy5zc3NoaCA9IHNzc2hoO1xuXG59KS5jYWxsKHRoaXMpO1xuIl19
;