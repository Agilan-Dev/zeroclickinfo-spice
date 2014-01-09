function ddg_spice_word_map(api_result) {
    // api_result is a string so we have to convert it to an object.
    var json = $.parseJSON(api_result);
    if ( 200 != json.result_code ) return;

    Spice.render({
        data             	: json,
        force_big_header 	: true,
        header1          	: "Related to " + json.entry + " (Levelpump)",
        source_url       	: 'http://levelpump.com/graph-dictionary.php?mailLink=' + json.encrypt_entry + '&from=ddg',
        source_name      	: 'Levelpump',
        template_normal  	: 'word_map'
    });
}


