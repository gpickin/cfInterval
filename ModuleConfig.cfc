component {

    this.name = "cfInterval";
    this.author = "Gavin Pickin, Scott Steinbeck";
    this.webUrl = "https://github.com/gpickin/cfInterval";

    function configure() {
        binder.map( "@cfInterval" ).to( "#moduleMapping#.models.timespan" );
    }

}
