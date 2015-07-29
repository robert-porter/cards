

class ShippingAddOn {
    constructor(shippingAddOns, name, friendlyName, prohibitedWith, amount) {
        this.shippingAddOns = shippingAddOns;
        this.name = name;
        this.friendlyName = friendlyName;
        this.prohibitedWith = prohibitedWith;
        this.prohibitingAddOns = []
        this.amount = amount;
        this.checked = false;
        let div = this.render();
        let addOns = $('#add-ons');
        addOns.append(div);
    }

    addOnAdded(addOn) {
        if(this.prohibitedWith.indexOf(addOn.name) != -1) {
            if(this.prohibitingAddOns.indexOf(addOn) == -1) {
                this.prohibitingAddOns.push(addOn);
                let div = $(this.checkbox).closest('.add-on-checkbox-group');
                div.empty();
                div.replaceWith(this.render());
            }
        }
    }
    addOnRemoved(addOn) {
        var index = this.prohibitingAddOns.indexOf(addOn);
        if (index != -1) {
            this.prohibitingAddOns.splice(index, 1);
            let div = $(this.checkbox).closest(".add-on-checkbox-group");
            div.empty();
            div.replaceWith(this.render());
        }
    }


    render() {
        let div = $('<div class="add-on-checkbox-group">');
        this.checkbox = $('<input />', { type: 'checkbox', class: 'add-on-checkbox', value: this.name, checked: this.checked });
        this.checkbox.prop('disabled', this.prohibitingAddOns.length > 0);
        div.append(this.checkbox);
        if(this.amount != "") {
            div.append("$" + Number(this.amount).toFixed(2) + ": ");
        }
        div.append(this.friendlyName);
        for(var i = 0; i < this.prohibitingAddOns.length; i++) {
            div.append(document.createTextNode(this.prohibitingAddOns[i].friendlyName + " "));
        }

        var self = this;

        this.checkbox.change(function() {
            if(this.checked) {
                self.shippingAddOns.checkboxSelected(self);
            }
            else {
                self.shippingAddOns.checkboxUnselected(self);
            }
        });

        return div;
    }
}



class ShippingAddOns {
    constructor(serviceAddOns) {
        this.serviceAddOns = serviceAddOns;
        this.shippingService = $('.service-name').first().val();
        var self = this;
        this.addOns = [];

        $(".service-name").change(function() {
            self.serviceChanged();
        });

        this.serviceChanged();
    }


    addCheckbox(name, friendlyName, prohibitedWith, amount) {
        this.addOns.push(new ShippingAddOn(this, name, friendlyName, prohibitedWith, amount ));
    }

    serviceChanged() {

        this.shippingService = $('.service-name').first().val();
        let price = this.serviceAddOns[this.shippingService].totalPrice;
        $('#shipping-price').html(price / 100);

        let addOns = this.serviceAddOns[this.shippingService].addOns;

        $('#add-ons').html('');
        for(var name in addOns) {
            if (addOns.hasOwnProperty(name)) {
                this.addCheckbox(name, addOns[name].friendlyName, addOns[name].prohibitedWith, addOns[name].amount);
            }
        }



    }

    checkboxSelected(addOn) {
        addOn.checked = true;
        for(var i = 0; i < this.addOns.length; i++) {
            this.addOns[i].addOnAdded(addOn);
        }

    }

    checkboxUnselected(addOn) {
        addOn.checked = false;
        for(var i = 0; i < this.addOns.length; i++) {
            this.addOns[i].addOnRemoved(addOn);
        }
    }
}