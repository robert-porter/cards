



function itemFormSubmit()
{
    var tagListEle = document.getElementById('tag_list');

    var tags = tagCollection.getItemTags();

    if(tags.length >= 1)
        tagListEle.value = tags[0];

    for(let i = 1; i < tags.length; i++)
    {
        tagListEle.value = tagListEle.value + ", " + tags[i];
    }

    return true;
}

class TagCollection {
    // tags are represented as a dictionary of strings to bools, the bool indicating that
    // the item has the tag when true.

    constructor(allTags, itemTags) {
        this.tags = {};

        for (var i = 0; i < allTags.length; i++) {
            this.tags[allTags[i]] = false;
        }

        for (i = 0; i < itemTags.length; i++)
        {
            this.tags[itemTags[i]] = true;
        }
    }

    hasTag(tag)
    {
        return this.tags[tag];
    }

    addTag(tag)
    {
        this.tags[tag] = true;
    }

    removeTag(tag)
    {
        this.tags[tag] = false;
    }

    getItemTags()
    {
        var itemTags = [];
        for(var tag in this.tags)
        {
            if (this.tags.hasOwnProperty(tag) && this.tags[tag])
            {
                itemTags.push(tag);
            }
        }

        return itemTags;
    }

    getAllTagsNotOnItem()
    {
        var tagsNotOnItem = [];
        for(var tag in this.tags)
        {
            if (this.tags.hasOwnProperty(tag) && !this.tags[tag])
            {
                tagsNotOnItem.push(tag);
            }
        }

        return tagsNotOnItem;
    }
    getAllTags()
    {
        var allTags = [];
        for(var tag in this.tags)
        {
            if (this.tags.hasOwnProperty(tag))
            {
                allTags.push(tag);
            }
        }

        return tagsNotOnItem;
    }
}

class TagView {

    setTagStyle(tagEle) {
        tagEle.style.cursor = 'default';
        tagEle.style.backgroundColor = 'rgb(250, 200, 100)';
        tagEle.style.borderColor = 'rgb(0, 100, 100)';
        tagEle.style.borderWidth = 'medium';
        tagEle.style.borderStyle = 'solid';
    }

    createTag(tagText)
    {
        var self = this;

        var tag = document.createElement('span');


        tag.style.cursor = 'default';
        tag.style.backgroundColor = 'rgb(250, 200, 100)';
        tag.style.borderColor = 'rgb(0, 100, 100)';
        tag.style.borderWidth = 'medium';
        tag.style.borderStyle = 'solid';
        tag.style.position = 'relative';
        tag.onmouseover = function() {
            var ele = this;
            var view = self;
            self.mouseOverTag(ele, view)
        };
        tag.onmouseout = function() {
            var ele = this;
            var view = self;
            self.mouseLeavesTag(ele, view)
        };
        tag.onclick = function() {
            var ele = this;
            var view = self;
            self.tagClicked(ele, view)
        };

        tag.addEventListener('mousedown', function(e) {e.preventDefault(); }, false);

        var text = document.createTextNode(tagText + " ");
        tag.appendChild(text);

        var plus = document.createElement('span');
        plus.appendChild(document.createTextNode('+'));
        plus.style.position = 'absolute';
        plus.style.fontWeight = 'bold';
        plus.style.fontSize = '1.4em';
        plus.style.top = '-7px';
        plus.style.right = '3px';
        plus.style.zIndex = 1;
        plus.style.color = 'rgb(0, 255, 0)';
        $(plus).hide();
        tag.appendChild(plus);

        var x = document.createElement('span');
        x.appendChild(document.createTextNode('x'));
        x.style.position = 'absolute';
        x.style.fontWeight = 'bold';
        x.style.fontSize = '1.4em';
        x.style.top = '-7px';
        x.style.right = '3px';
        x.style.zIndex = 1;
        x.style.color = 'rgb(255, 0, 0)';
        $(x).hide();
        tag.appendChild(x);

        return tag;
    }

    render()
    {
        var itemTagsEle = document.getElementById('item-tags');
        var tagsNotOnItemEle = document.getElementById(('tags-not-on-item'));

        itemTagsEle.setAttribute("style","display:block;width:200px");
        itemTagsEle.style.width='400px';
        itemTagsEle.style.display = 'block';

        tagsNotOnItemEle.setAttribute("style","display:block;width:200px");
        tagsNotOnItemEle.style.display = 'none';
        tagsNotOnItemEle.style.width='400px';
        $(tagsNotOnItemEle).fadeOut();

        var itemTags = tagCollection.getItemTags();
        var tagsNotOnItem = tagCollection.getAllTagsNotOnItem();

        for(var i = 0; i < itemTags.length; i++)
        {
            var tag = this.createTag(itemTags[i]);
            itemTagsEle.appendChild(tag);
        }

        for(i = 0; i < tagsNotOnItem.length; i++)
        {
            var tag = this.createTag(tagsNotOnItem[i]);
            tagsNotOnItemEle.appendChild(tag);
        }
    }

    mouseOverTag(element, view) {
        //element.style.backgroundColor = 'rgb(40, 200, 100)';
        element.style.borderColor = 'rgb(0, 100, 100)';
        element.style.borderWidth = 'medium';
        element.style.borderStyle = 'solid';

        if($(element).parent().attr('id') == 'item-tags')
            $(element.childNodes[2]).show();
        else
            $(element.childNodes[1]).show();

    }

    mouseLeavesTag(element, view) {
        //element.style.backgroundColor = 'rgb(250, 200, 100)';
        element.style.borderColor = 'rgb(0, 100, 100)';
        element.style.borderWidth = 'medium';
        element.style.borderStyle = 'solid';

        if($(element).parent().attr('id') == 'item-tags')
            $(element.childNodes[2]).hide();
        else
            $(element.childNodes[1]).hide();
    }

    tagClicked(element, view) {

        var itemTagsEle = document.getElementById('item-tags');
        var tagsNotOnItemEle = document.getElementById(('tags-not-on-item'));

        $(element.childNodes[1]).hide();
        $(element.childNodes[2]).hide();

        if(element.parentNode == itemTagsEle) {
            tagsNotOnItemEle.appendChild(element);
            tagCollection.removeTag($(element.firstChild).text().trim());
        }
        else
        {
            itemTagsEle.appendChild(element);
            tagCollection.addTag($(element.firstChild).text().trim());
        }



        view.mouseLeavesTag(element, view);
    }
}



$(function() {
    $('#tag_list').keypress(function(e) {
    e.preventDefault();
    e.cancelBubble = true;
    return false;
    });

    var tagView = new TagView();
    tagView.render();
});