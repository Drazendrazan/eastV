window.addEventListener("message", function (event) {
  var vehicle = event.data;
  switch (vehicle.carhud) {
    case "arabada":
      $("body").css({ display: `block` });
      //
      if (vehicle.gear == 0 && vehicle.rpm > 1) {
        $(".gear").text(`R`).css({color : '#ff0000'});
      } else if (vehicle.gear == 0) {
        $(".gear").text(`P`).css({color : '#fdee00'});
      } else if (vehicle.gear > 0) {
        $(".gear").text(vehicle.gear).css({color : '#66ff00'});
      }
      var speedsInt = vehicle.speed.toFixed();
      if (vehicle.speed < 10) {
        $(".speed").text("00" + speedsInt);
      } else if (vehicle.speed < 100) {
        $(".speed").text("0" + speedsInt);
      } else if (vehicle.speed > 100) {
        $(".speed").text(speedsInt);
      }

      $(".fuellevel").text(vehicle.fuel + "%");
      if (vehicle.fuel < 100) {
        $(".fuellevel").text("%" + vehicle.fuel);
        $(document).ready(function () {
          $(".fuellevel").each(function (f) {
            var newstr = $(this).text().substring(0, 3);
            $(this).text(newstr);
          });
        });
      }
      if (vehicle.far == 0) {
        $(".fa-lightbulb").css({ color: `#534F4E` });
      } else if (vehicle.far == 1) {
        $(".fa-lightbulb").css({ color: `#70af49` });
      } else if (vehicle.far == 2) {
        $(".fa-lightbulb").css({ color: `#58873a` });
      }
      if (vehicle.motor > 900.0) {
        $(".fa-triangle-exclamation").css({ color: `#00F627` });
      } else if (vehicle.motor > 500.0) {
        $(".fa-triangle-exclamation").css({ color: `#F6D300` });
      } else if (vehicle.motor > 100.0) {
        $(".fa-triangle-exclamation").css({ color: `#F60000` });
      }
      break;
    case "indi":
      $("body").css({ display: `none` });
      break;
  }
});
