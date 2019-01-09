document.addEventListener("turbolinks:load", function() {
	$input = $("[data-behavior='autocomplete']")

	var options = {
		getValue: "first_name",
		url: function(phrase) {
			return "/search.json?q=" + phrase;
		},
		categories: [
			{
				listLocation: "children",
				header: "<strong>Barn</strong>",
			},{
				listLocation: "members",
				header: "<hr><strong>Foreldre</strong>",
			}
		],
		list: {
			onChooseEvent: function() {
				var url = $input.getSelectedItemData().url
				$input.val("")
				Turbolinks.visit(url)
			}
		}
	}
	$input.easyAutocomplete(options)
});