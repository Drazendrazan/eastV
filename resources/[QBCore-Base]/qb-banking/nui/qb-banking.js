var Config = new Object();
Config.closeKeys = [69, 27];
Config.ATMTransLimit = 5000;
var currentLimit = null;
var clientPin = null;

window.addEventListener("message", function (event) {
  if (event.data.status == "openbank") {
    $("#cardDetails").css({ display: "none" });
    $("#createNewPin").css({ display: "none" });
    $("#successMessageATM")
      .removeClass("alert-danger")
      .addClass("alert-success");
    $("#successRowATM").css({ display: "none" });
    $("#successMessageATM").html("");
    $("#withdrawATMError").css({ display: "none" });
    $("#withdrawATMErrorMsg").html("");
    $("#savingsStatement").DataTable().destroy();
    $("#currentStatement").DataTable().destroy();
    $("#currentStatementATM").DataTable().destroy();
    $("#accountName").html(event.data.information.name);
    $("#accountNumber").html(event.data.information.accountinfo);
    $("#accountSortCode").html(event.data.information.accountinfo.sort_code);

    $("#newPinNumber").val("");
    $("#bankingHome-tab").addClass("active");
    $("#bankingWithdraw-tab").removeClass("active");
    $("#bankingDeposit-tab").removeClass("active");
    $("#bankingTransfer-tab").removeClass("active");
    $("#bankingStatement-tab").removeClass("active");
    $("#bankingActions-tab").removeClass("active");
    $("#bankingSavings-tab").removeClass("active");
    $("#bankingHome").addClass("active").addClass("show");
    $("#bankingWithdraw").removeClass("active").removeClass("show");
    $("#bankingSavings").removeClass("active").removeClass("show");
    $("#bankingDeposit").removeClass("active").removeClass("show");
    $("#bankingTransfer").removeClass("active").removeClass("show");
    $("#bankingStatement").removeClass("active").removeClass("show");
    $("#bankingActions").removeClass("active").removeClass("show");

    $("#savingsStatementContents").html("");
    $("#savingsBalance").html("");
    $("#accountName2").html("");
    $("#saccountNumber").html("");
    $("#saccountSortCode").html("");
    $("#savingAccountCreator").css({ display: "block" });
    $("#savingsQuicky1").css({ display: "none" });
    $("#bankingSavings-tab").css({ display: "none" });
    $("#savingsQuicky2").css({ display: "none" });
    if (
      event.data.information.savings !== undefined &&
      event.data.information.savings !== null
    ) {
      setupSavingsMenu(
        event.data.information.savings,
        event.data.information.name
      );
    } else {
      enableSavingsCreator();
    }
    if (
      event.data.information.cardInformation !== undefined &&
      event.data.information.cardInformation !== null
    ) {
      $("#cardType").html(event.data.information.cardInformation.type);
      var str = "" + event.data.information.cardInformation.cardNumber + "";
      var res = str.slice(12);
      var cardNumber = "************" + res;
      $("#cardNumberShow").html(cardNumber);
    }
    populateBanking(event.data.information);
    $("#bankingContainer").css({ display: "block" });
  } else if (event.data.status == "updateCard") {
    $("#cardType").html(event.data.cardtype);
    var str = "" + event.data.number + "";
    var res = str.slice(12);
    var cardNumber = "************" + res;
    $("#cardNumberShow").html(cardNumber);
  } else if (event.data.status == "closebank") {
    $("#cardDetails").css({ display: "none" });
    $("#createNewPin").css({ display: "none" });
    $("#bankingHomeATM, #bankingWithdrawATM, #bankingStatementATM")
      .removeClass("show")
      .removeClass("active");
    $("#bankingHomeATM, #bankingWithdrawATM, #bankingStatementATM")
      .removeClass("show")
      .removeClass("active");
    $("#withdrawATMErrorMsg")
      .removeClass("alert-success")
      .addClass("alert-danger");
    $("#successMessageATM")
      .removeClass("alert-danger")
      .addClass("alert-success");
    $("#successRowATM").css({ display: "none" });
    $("#successMessageATM").html("");
    $("#withdrawATMError").css({ display: "none" });
    $("#withdrawATMErrorMsg").html("");
    $("#savingsStatement").DataTable().destroy();
    $("#currentStatement").DataTable().destroy();
    $("#currentStatementATM").DataTable().destroy();
    $("#enteringPin").addClass("show").addClass("active");
    $(
      "#bankingHomeATM-tab, #bankingWithdrawATM-tab, #bankingTransferATM-tab, #bankingStatementATM-tab"
    )
      .addClass("disabled")
      .removeClass("active");
    $("#bankingHomeATM-tab").addClass("active");
    $("#createNewPin").css({ display: "block" });
    $("#successRow").css({ display: "none" });
    $("#successMessage").html("");
    $("#bankingContainer").css({ display: "none" });
    $("#savingsQuicky").css({ display: "none" });
    $("#savingAccountCreator").css({ display: "none" });
    $("#ATMContainer").css({ display: "none" });
  } else if (event.data.status == "transferError") {
    if (event.data.error !== undefined) {
      $("#transferError").css({ display: "block" });
      $("#transferErrorMsg").html(event.data.error);
    }
  } else if (event.data.status == "successMessage") {
    if (event.data.message !== undefined) {
      $("#successRow").css({ display: "block" });
      $("#successMessage").html(event.data.message);
    }
  }
});

function dynamicSort(property) {
  var sortOrder = 1;
  if (property[0] === "-") {
    sortOrder = -1;
    property = property.substr(1);
  }
  return function (a, b) {
    var result =
      a[property] < b[property] ? -1 : a[property] > b[property] ? 1 : 0;
    return result * sortOrder;
  };
}

function setupSavingsMenu(data, name) {
  statement2 = data.statement;
  $("#savingsStatementContents").html("");
  $("#savingsBalance").html(data.amount);
  $("#accountName2").html(name);
  $("#saccountNumber").html(data.details.account);
  $("#saccountSortCode").html(data.details.sortcode);
  $("#savingAccountCreator").css({ display: "none" });
  $("#savingsQuicky1").css({ display: "block" });
  $("#bankingSavings-tab").css({ display: "block" });
  $("#savingsQuicky2").css({ display: "block" });
  if (statement2 !== undefined) {
    statement2.sort(dynamicSort("date"));
    $.each(statement2, function (index, statement) {
      // console.log(index)
      if (statement.deposited == null && statement.deposited == undefined) {
        deposit = "0";
      } else {
        deposit = statement.deposited;
      }
      if (statement.withdraw == null && statement.withdraw == undefined) {
        withdraw = "0";
      } else {
        withdraw = statement.withdraw;
      }
      if (statement.balance == 0) {
        balance = '<span class="text-dark">$' + statement.balance + "</span>";
      } else if (statement.balance > 0) {
        balance =
          '<span class="text-success">$' + statement.balance + "</span>";
      } else {
        balance = '<span class="text-danger">$' + statement.balance + "</span>";
      }
      $("#savingsStatementContents").append(
        '<tr class="statement"><td><small>' +
          statement.date +
          "</small></td><td><small>" +
          statement.type +
          '</small></td><td class="text-center text-danger"><small>$' +
          withdraw +
          '</small></td><td class="text-center text-success"><small>$' +
          deposit +
          '</small></td><td class="text-center"><small>' +
          balance +
          "</small></td></tr>"
      );
    });

    $(document).ready(function () {
      $("#savingsStatement").DataTable({
        order: [[0, "desc"]],
        pagingType: "simple",
      });
    });
  }
}

function enableSavingsCreator() {
  $("#savingAccountCreator").css({ display: "block" });
}

function populateBanking(data) {
  $("#newPinNumber").val("");
  $("#createNewPin").css({ display: "none" });
  $("#cardInactive").css({ display: "none" });
  $("#cardOrdering").css({ display: "none" });
  $("#withdrawAmount").val("");
  $("#customerName").html(data.name);
  $("#currentBalance").html(data.bankbalance);
  $("#currentCashBalance").html(data.cash);
  $("#currentBalance1").html(data.bankbalance);
  $("#currentCashBalance1").html(data.cash);
  $("#currentBalance2").html(data.bankbalance);
  $("#currentCashBalance2").html(data.cash);
  $("#currentStatementContents").html("");
  if (data.cardInformation !== undefined) {
    if (data.cardInformation.cardLocked == true) {
      $("#debitCardStatus").removeClass("bg-success");
      $("#debitCardStatus").addClass("bg-danger");
      $("#debitCardStatus").html(
        '<div class="card-header">Kart Bloke Edildi</div><div class="card-body">Kartın Şuanda Bloke</div><div class="card-footer"><button class="btn btn-primary btn-block" id="unLockCard">Kilit/Bloke Kaldır</button></div>'
      );
    } else {
      $("#debitCardStatus").removeClass("bg-danger");
      $("#debitCardStatus").addClass("bg-success");
      $("#debitCardStatus").html(
        '<div class="card-header">Kart Blokesi Kaldırıldı</div><div class="card-body">Kartın Şuanda Aktif.</div><div class="card-footer"><button class="btn btn-primary btn-block" id="lockCard">Kilitle/Bloke Et</button></div>'
      );
    }
    $("#cardDetails").css({ display: "block" });
  } else {
    $("#cardOrdering").css({ display: "none" });
    $("#cardInactive").css({ display: "block" });
  }

  if (data.statement !== undefined) {
    data.statement.sort(dynamicSort("date"));
    $.each(data.statement, function (index, statement) {
      if (statement.deposited == null && statement.deposited == undefined) {
        deposit = "0";
      } else {
        deposit = statement.deposited;
      }
      if (statement.withdraw == null && statement.withdraw == undefined) {
        withdraw = "0";
      } else {
        withdraw = statement.withdraw;
      }
      if (statement.balance == 0) {
        balance = '<span class="text-dark">$' + statement.balance + "</span>";
      } else if (statement.balance > 0) {
        balance =
          '<span class="text-success">$' + statement.balance + "</span>";
      } else {
        balance = '<span class="text-danger">$' + statement.balance + "</span>";
      }
      $("#currentStatementContents").append(
        '<tr class="statement"><td><small>' +
          statement.date +
          "</small></td><td><small>" +
          statement.type +
          '</small></td><td class="text-center text-danger"><small>$' +
          withdraw +
          '</small></td><td class="text-center text-success"><small>$' +
          deposit +
          '</small></td><td class="text-center"><small>' +
          balance +
          "</small></td></tr>"
      );
    });

    $(document).ready(function () {
      $("#currentStatement").DataTable({
        order: [[0, "desc"]],
        pagingType: "simple",
        lengthMenu: [
          [20, 35, 50, -1],
          [20, 35, 50, "All"],
        ],
      });
    });
  }
}

function pad(n, width, z) {
  z = z || "0";
  n = n + "";
  return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}

function closeBanking() {
  $.post("https://qb-banking/NUIFocusOff", JSON.stringify({}));
}

$(function () {
  $("body").on("keydown", function (key) {
    if (Config.closeKeys.includes(key.which)) {
      closeBanking();
    }
  });

  $(document).on("click", "#lockCard", function () {
    $("#debitCardStatus").removeClass("bg-success");
    $("#debitCardStatus").addClass("bg-danger");
    $("#debitCardStatus").html(
      '<div class="card-header">Kart Bloke Edildi</div><div class="card-body">Kartın Şuanda Bloke.</div><div class="card-footer"><button class="btn btn-primary btn-block" id="unLockCard">Kilit/Bloke Kaldır</button></div>'
    );
    $.post("https://qb-banking/lockCard", JSON.stringify({}));
  });

  $(document).on("click", "#unLockCard", function () {
    $("#debitCardStatus").removeClass("bg-danger");
    $("#debitCardStatus").addClass("bg-success");
    $("#debitCardStatus").html(
      '<div class="card-header">Kart Blokesi Kaldırıldı</div><div class="card-body">Kartın Şuanda Aktif.</div><div class="card-footer"><button class="btn btn-primary btn-block" id="lockCard">Kilitle/Bloke Et</button></div>'
    );
    $.post("https://qb-banking/unLockCard", JSON.stringify({}));
  });

  $("#openSavings").click(function () {
    $.post("https://qb-banking/createSavingsAccount", JSON.stringify({}));
  });

  $("#changePin").click(function () {
    $("#createNewPin").css({ display: "block" });
  });

  $("#updateNewPin").click(function () {
    var newPin = $("#newPinNumber").val();

    if (
      newPin !== null &&
      newPin !== undefined &&
      newPin.replace(/[^0-9]/g, "").length === 4
    ) {
      $("#newPinReqMsgDiv").css({ display: "none" });
      $("#newPinReqMsg").html("");
      $.post(
        "https://qb-banking/updatePin",
        JSON.stringify({
          pin: pad(newPin, 4),
        })
      );
      $("#newPinNumber").val("");
    } else {
      $("#newPinReqMsgDiv").css({ display: "block" });
      $("#newPinReqMsg").html(
        "PIN'inizi güncellemek için 4 basamaklı rastgele bir sayı belirtmeniz gerekir."
      );
    }
  });

  $("#initiateWithdraw").click(function () {
    var amount = $("#withdrawAmount").val();

    if (amount !== undefined && amount > 0) {
      $("#withdrawError").css({ display: "none" });
      $("#withdrawErrorMsg").html("");
      $.post(
        "https://qb-banking/doWithdraw",
        JSON.stringify({
          amount: parseInt(amount),
        })
      );
      $("#withdrawAmount").val("");
    } else {
      // Error doing withdraw
      $("#withdrawError").css({ display: "block" });
      $("#withdrawErrorMsg").html(
        "Para çekme işleminiz yapılırken bir hata oluştu, tutar girilmedi veya pozitif bir sayı değil"
      );
    }
  });

  $("#initiateWithdrawATM").click(function () {
    var amount = $("#withdrawAmountATM").val();
    if (currentLimit + parseInt(amount) <= Config.ATMTransLimit) {
      if (amount !== undefined && amount > 0) {
        $("#withdrawATMError").css({ display: "none" });
        $("#withdrawATMErrorMsg").html("");
        $.post(
          "https://qb-banking/doATMWithdraw",
          JSON.stringify({
            amount: parseInt(amount),
          })
        );
        $("#withdrawAmountATM").val("");
        $("#withdrawATMErrorMsg")
          .removeClass("alert-danger")
          .addClass("alert-success");
        $("#withdrawATMError").css({ display: "none" });
        $("#withdrawATMErrorMsg").html(
          "Başarılı ile " + amount + " $ Hesabından Çektin."
        );
        currentLimit = currentLimit + parseInt(amount);
      } else {
        // Error doing withdraw
        $("#withdrawATMErrorMsg")
          .removeClass("alert-success")
          .addClass("alert-danger");
        $("#withdrawATMError").css({ display: "block" });
        $("#withdrawATMErrorMsg").html(
          "Para çekme işleminiz yapılırken bir hata oluştu, tutar girilmedi veya pozitif bir sayı değil"
        );
      }
    } else {
      $("#withdrawATMErrorMsg")
        .removeClass("alert-success")
        .addClass("alert-danger");
      $("#withdrawATMError").css({ display: "block" });
      $("#withdrawATMErrorMsg").html(
        "Üzgünüz Günlük Para Çekme Limitine Ulaştınız" +
          Config.ATMTransLimit +
          " acil paraya ihtiyacınız varsa lütfen bir şube kullanın."
      );
    }
  });

  $("#initiateDeposit").click(function () {
    var amount = $("#depositAmount").val();

    if (amount !== undefined && amount > 0) {
      $("#depositError").css({ display: "none" });
      $("#depositErrorMsg").html("");
      $.post(
        "https://qb-banking/doDeposit",
        JSON.stringify({
          amount: parseInt(amount),
        })
      );
      $("#depositAmount").val("");
    } else {
      // Error doing withdraw
      $("#depositError").css({ display: "block" });
      $("#depositErrorMsg").html(
        "Para yatırma işleminiz işlenirken bir hata oluştu, tutar girilmedi veya pozitif bir sayı değil"
      );
    }
  });

  $("[data-action=deposit]").click(function () {
    var amount = $(this).attr("data-amount");
    if (amount > 0) {
      $.post(
        "https://qb-banking/doDeposit",
        JSON.stringify({
          amount: parseInt(amount),
        })
      );
    }
  });

  $("#orderCardBtn").click(function () {
    $("#cardInactive").css({ display: "none" });
    $("#cardOrdering").css({ display: "block" });
  });

  $("#processCard").click(function () {
    var pinValue = $("#cardPinNumber").val();
    // console.log(pinValue.replace(/[^0-9]/g,"").length);
    if (
      pinValue !== null &&
      pinValue !== undefined &&
      pinValue.replace(/[^0-9]/g, "").length === 4
    ) {
      $("#pinCreatorError").css({ display: "none" });
      $("#pinCreatorErrorMsg").html("");
      $.post(
        "https://qb-banking/createDebitCard",
        JSON.stringify({
          pin: pad(pinValue, 4),
        })
      );
    } else {
      $("#pinCreatorError").css({ display: "block" });
      $("#pinCreatorErrorMsg").html(
        "Oluşturmaya çalıştığınız pinde bir hata oluştu, lütfen 4 hane uzunluğunda rastgele bir sayı oluşturun."
      );
    }
  });

  $("#initiateTransfer").click(function () {
    var amount = $("#transferAmount").val();
    var sortcode = $("#transferSortCode").val();
    var account = $("#transferAcctNo").val();

    if (
      amount !== undefined &&
      amount !== null &&
      amount > 0 &&
      sortcode !== undefined &&
      sortcode !== null &&
      sortcode > 0 &&
      account !== undefined &&
      account !== null &&
      account > 0
    ) {
      $("#transferError").css({ display: "none" });
      $("#transferErrorMsg").html("");
      $.post(
        "https://qb-banking/doTransfer",
        JSON.stringify({
          amount: parseInt(amount),
          account: parseInt(account),
          sortcode: parseInt(sortcode),
        })
      );
      $("#transferAmount").val("");
      $("#transferSortCode").val("");
      $("#transferAcctNo").val("");
    } else {
      $("#transferError").css({ display: "block" });
      $("#transferErrorMsg").html(
        "Girdiğiniz bilgilerde bir hata oluştu, lütfen hesap numarası, sıralama kodu ve tutarın doğru doldurulduğundan emin olun."
      );
    }
  });

  $("[data-action=withdraw]").click(function () {
    var amount = $(this).attr("data-amount");
    if (amount > 0) {
      $.post(
        "https://qb-banking/doWithdraw",
        JSON.stringify({
          amount: parseInt(amount),
        })
      );
    }
  });

  $("[data-action=ATMwithdraw]").click(function () {
    var amount = $(this).attr("data-amount");
    if (currentLimit + parseInt(amount) <= Config.ATMTransLimit) {
      if (amount > 0) {
        $.post(
          "https://qb-banking/doATMWithdraw",
          JSON.stringify({
            amount: parseInt(amount),
          })
        );
        $("#successMessageATM")
          .removeClass("alert-danger")
          .addClass("alert-success");
        $("#successRowATM").css({ display: "none" });
        $("#successMessageATM").html("");
        currentLimit = currentLimit + parseInt(amount);
      }
    } else {
      // Error Daily Limit Hit.
      $("#successMessageATM")
        .removeClass("alert-success")
        .addClass("alert-danger");
      $("#successRowATM").css({ display: "block" });
      $("#successMessageATM").html(
        "Maalesef Günlük Para Çekme limitine ulaştınız" +
          Config.ATMTransLimit +
          " $ acil paraya ihtiyacınız varsa lütfen bir şube kullanın."
      );
    }
  });

  $("[data-action=savingsdeposit]").click(function () {
    var amount = $(this).attr("data-amount");
    if (amount > 0) {
      $.post(
        "https://qb-banking/savingsDeposit",
        JSON.stringify({
          amount: parseInt(amount),
        })
      );
    }
  });

  $("#makeNewCardRequestBtn1").click(function () {
    $("#requestNewCard1").css({ display: "none" });
    $("#requestNewCard2").css({ display: "block" });
  });

  $("#cancelNewCardReq").click(function () {
    $("#requestNewCard2").css({ display: "none" });
    $("#requestNewCard1").css({ display: "block" });
  });

  $("#confirmCardRequest").click(function () {
    $("#requestNewCard2").css({ display: "none" });
    $("#requestNewCard3").css({ display: "block" });

    $.post("https://qb-banking/requestNewCard", JSON.stringify({}));

    setTimeout(function () {
      $("#requestNewCard3").css({ display: "none" });
      $("#requestNewCard1").css({ display: "block" });
    }, 5000);
  });

  $("#makeSavingsTransfer").click(function () {
    var amount = $("#savingsTAmount").val();
    var action = $("#savingsAction").val();

    if (
      action !== null &&
      action !== undefined &&
      action !== "def" &&
      amount !== null &&
      amount !== undefined &&
      amount > 0
    ) {
      if (action == "deposit") {
        $("#savingsTAmount").val("");
        $("#savingsAction").val("def");
        $.post(
          "https://qb-banking/savingsDeposit",
          JSON.stringify({
            amount: parseInt(amount),
          })
        );
      } else {
        $("#savingsTAmount").val("");
        $("#savingsAction").val("def");
        $.post(
          "https://qb-banking/savingsWithdraw",
          JSON.stringify({
            amount: parseInt(amount),
          })
        );
      }
    }
  });

  $("[data-action=pinNumberBtn]").click(function () {
    var number = $(this).attr("data-number");
    if (number == "ENTER") {
      var enteredPin = $("#pinEntered").val();
      if (
        (enteredPin !== null && enteredPin !== undefined) ||
        enteredPin.replace(/[^0-9]/g, "").length !== 4
      ) {
        if (clientPin == enteredPin) {
          $("#pinErrorMsg").html("");
          $("#pinErrorDiv").css({ display: "none" });
          $("#pinEntered").val("");
          loadAtmScreen();
        } else {
          $("#pinErrorMsg").html("Yanlış pin numarası girdiniz.");
          $("#pinErrorDiv").css({ display: "block" });
        }
      } else {
        $("#pinErrorMsg").html(
          "4 Hane uzunluğunda bir Pin girmeniz gerekmektedir."
        );
        $("#pinErrorDiv").css({ display: "block" });
      }
    } else if (number == "CLEAR") {
      // pin cleared
      $("#pinErrorMsg").html("");
      $("#pinErrorDiv").css({ display: "none" });
      $("#pinEntered").val("");
    } else {
      var currentVal = $("#pinEntered").val();
      $("#pinEntered").val(currentVal + number);
    }
  });

  $("[data-action=savingswithdraw]").click(function () {
    var amount = $(this).attr("data-amount");
    if (amount > 0) {
      $.post(
        "https://qb-banking/savingsWithdraw",
        JSON.stringify({
          amount: parseInt(amount),
        })
      );
    }
  });

  $("#logoffbutton, #logoffbuttonatm").click(function () {
    closeBanking();
  });
});
