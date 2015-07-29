class Checkout {
    constructor() {

        let self = this;

        $('#email').change(function() {
            self.email = self.validateEmail($(this).val());
            self.showValidation(this, self.email);
            self.showPanelValidation(this, self.contactValid());
        });
        $('#phone').change(function() {
            self.phone = self.validatePhone($(this).val());
            self.showValidation(this, self.phone);
            self.showPanelValidation(this, self.contactValid());
        });

        $('#shipping-address-1').change(function() {
            self.shippingAddress1 = $(this).val() != ''
            self.showValidation(this, self.shippingAddress1);
            self.showPanelValidation(this, self.shippingAddressValid());
        });
        $('#shipping-city').change(function() {
            self.shippingCity = $(this).val() != ''
            self.showValidation(this, self.shippingCity);
            self.showPanelValidation(this, self.shippingAddressValid());
        });
        $('#shipping-state').change(function() {
            self.shippingState = $(this).val() != ''
            self.showValidation(this, self.shippingState);
            self.showPanelValidation(this, self.shippingAddressValid());
        });
        $('#shipping-zip').change(function() {
            self.shippingZip = self.validateZip($(this).val());
            self.showValidation(this, self.shippingZip);
            self.showPanelValidation(this, self.shippingAddressValid());
        });

        $('#card-first-name').change(function() {
            self.cardFirstName = $(this).val() != ''
            self.showValidation(this, self.cardFirstName);
            self.showPanelValidation(this, self.cardValid());
        });

        $('#card-last-name').change(function() {
            self.cardLastName = $(this).val() != ''
            self.showValidation(this, self.cardLastName);
            self.showPanelValidation(this, self.cardValid());
        });

        $('#card-type').change(function() {
            self.cardType = $(this).val() != ''
            self.showValidation(this, self.cardType);
            self.showPanelValidation(this, self.cardValid());
        });

        $('#card-number').change(function() {
            self.cardNumber = self.validateCardNumber($(this).val());
            self.showValidation(this, self.cardNumber);
            self.showPanelValidation(this, self.cardValid());
        });

        $('#card-verification').change(function() {
            self.cardVerification = self.validateCardVerification($(this).val());
            self.showValidation(this, self.cardVerification);
            self.showPanelValidation(this, self.cardValid());
        });

        $('#card-expiration-month').change(function() {
            self.cardExpirationMonth = $(this).val() != ''
            self.showValidation(this, self.cardExpirationMonth);
            self.showPanelValidation(this, self.cardValid());
        });

        $('#card-expiration-year').change(function() {
            self.cardExpirationYear = $(this).val() != ''
            self.showValidation(this, self.cardExpirationYear);
            self.showPanelValidation(this, self.cardValid());
        });

        $('#billing-address-1').change(function() {
            self.billingAddress1 = $(this).val() != ''
            self.showValidation(this, self.billingAddress1);
            self.showPanelValidation(this, self.billingAddressValid());
        });
        $('#billing-city').change(function() {
            self.billingCity = $(this).val() != ''
            self.showValidation(this, self.billingCity);
            self.showPanelValidation(this, self.billingAddressValid());
        });
        $('#billing-state').change(function() {
            self.billingState = $(this).val() != ''
            self.showValidation(this, self.billingState);
            self.showPanelValidation(this, self.billingAddressValid());
        });
        $('#billing-zip').change(function() {
            self.billingZip = self.validateZip($(this).val());
            self.showValidation(this, self.billingZip);
            self.showPanelValidation(this, self.billingAddressValid());
        });
    }

    contactValid() {
        return this.email && this.phone;
    }

    shippingAddressValid() {
        return this.shippingAddress1 && this.shippingCity && this.shippingState && this.shippingZip;
    }
    
    billingAddressValid() {
        return this.billingAddress1 && this.billingCity && this.billingState && this.billingZip;
    }

    cardValid() {
        return this.cardFirstName &&
            this.cardLastName &&
            this.cardType &&
            this.cardNumber &&
            this.cardVerification &&
            this.cardExpirationMonth &&
            this.cardExpirationYear;
    }

    showPanelValidation(ele, valid) {
        if(valid) {
            $(ele).closest('.panel').find('.panel-heading .glyphicon-asterisk').hide();
            $(ele).closest('.panel').find('.panel-heading .glyphicon-ok').show();
        }
        else {
            $(ele).closest('.panel').find('.panel-heading .glyphicon-asterisk').show();
            $(ele).closest('.panel').find('.panel-heading .glyphicon-ok').hide();
        }
    }


    showValidation(ele, valid) {
        if(valid) {
            $(ele).closest('.row').find('.glyphicon-asterisk').hide();
            $(ele).closest('.row').find('.glyphicon-ok').show();
        }
        else {
            $(ele).closest('.row').find('.glyphicon-asterisk').show();
            $(ele).closest('.row').find('.glyphicon-ok').hide();
        }
    }

    validateEmail(email) {
        var re = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/
        return re.test(email);

    }
    validatePhone(number) {
        var re = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
        return re.test(number);
    }
    validateZip(number) {
        var re =  /(^\d{5}$)|(^\d{5}-\d{4}$)/
        return re.test(number);
    }
    validateCardNumber(number) {
        var re = /^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$/
        return re.test(number);
    }
    validateCardVerification(number) {
        var re = /^[0-9]{3,4}$/
        return re.test(number);
    }
}