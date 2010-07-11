(function () {

    jQuery.fn.listable = function (options) {

        var defaults = {
            allowSorting: false,
            onAdd: null,
            onRemove: null,
            onIndex: null,
            footerNamePrefix: "footer_",
            beforeRemove: null
        };

        var opts = jQuery.extend(defaults, options);
        var tbls = this;

        tbls.each(function () {

            var tbl = jQuery(this);
            if (!tbl.get(0).listable) {

                tbl.get(0).listable = true;

                var tbody = jQuery("tbody", tbl);
                var tfoot = jQuery("tfoot", tbl);

                jQuery("tr", tbody).append("<td><div title=\"Remove\" class=\"item-remove\"></div></td>");
                jQuery("tr", tfoot).append("<td><div title=\"Add This Item\" class=\"item-add\"></div></td>");

                if (opts.allowSorting) {
                    jQuery("tr", tbody).prepend("<td><div class=\"item-sort\"></div></td>");
                    jQuery("tr", tfoot).prepend("<td></td>");
                    jQuery(tbody).sortable({
                        handle: "div.item-sort",
                        update: function () { reIndex(); }
                    });
                }

                jQuery("div.item-add", tfoot).live("click", function () {

                    var origTr = jQuery(this).closest("tr");
                    var vals = []; // Stash the values to workaround the select element clone bug in jQuery
                    jQuery("select", origTr).each(function () { vals.push(jQuery(this).val()); });

                    var tr = jQuery(this).closest("tr").clone();

                    // Reset the values to workaround the select element clone bug in jQuery
                    jQuery("select", tr).each(function (i) { jQuery(this).val(vals[i]); });

                    jQuery("div.item-add", tr).removeClass("item-add").addClass("item-remove");
                    if (opts.footerNamePrefix) { removeFooterNamePrefix(tr); }
                    tbody.append(tr);
                    reIndex();
                    jQuery("tfoot :input", tbl).val("");
                    if (opts.allowSorting) {
                        jQuery("td:first-child", tr).append("<div class=\"item-sort\"></div>");
                    }
                    if (opts.onAdd) { opts.onAdd(tr); }
                });

                jQuery("div.item-remove", tbody).live("click", function () {
                    var tr = jQuery(this).closest("tr");
                    if (opts.beforeRemove) {
                        var callback = function () { removeItem(tr); }
                        opts.beforeRemove(tr, callback);
                        return;
                    }
                    removeItem(tr);
                });

                function removeItem(tr) {
                    tr.fadeOut(function () { tr.remove(); reIndex(); });
                    if (opts.onRemove) { opts.onRemove(tr); }
                }

                function removeFooterNamePrefix(tr) {
                    jQuery(":input", tr).each(function () {
                        var el = jQuery(this);
                        el.attr("name", el.attr("name").replace(opts.footerNamePrefix, ""));
                        el.attr("id", el.attr("id").replace(opts.footerNamePrefix, ""));
                    });
                }

                function reIndex() {
                    var trs = jQuery("tr", tbody);
                    var n = 0;
                    trs.each(function (i) {
                        var els = jQuery(":input", this);
                        els.each(function () {
                            var el = jQuery(this);
                            var curIdx = el.attr("name").match(/\[(\d+)\]/)[1];
                            el.attr("name", el.attr("name").replace("[" + curIdx + "]", "[" + i + "]"));
                            el.attr("id", el.attr("id").replace("_" + curIdx + "__", "_" + i + "__"));
                        });
                        n = i;
                    });
                    if (opts.onIndex) { opts.onIndex(); }
                }
            }
        });
    };

})(jQuery);