component extends="coldbox.system.testing.basetestcase" appMapping="/app" {

    function beforeAll() {
        super.beforeAll();
    }

    function run() {
        describe( "TimeSpan Initialization", function() {
            it( "should create a TimeSpan object", function() {
                var ts = new root.models.timespan( 1);
                expect( ts ).toBeInstanceOf( "timespan" );
                var ts = new root.models.timespan( 1, 2 );
                expect( ts ).toBeInstanceOf( "timespan" );
                var ts = new root.models.timespan( 1, 2, 3 );
                expect( ts ).toBeInstanceOf( "timespan" );
                var ts = new root.models.timespan( 1, 2, 3, 4 );
                expect( ts ).toBeInstanceOf( "timespan" );
                var ts = new root.models.timespan( 1, 2, 3, 4, 5 );
                expect( ts ).toBeInstanceOf( "timespan" );
            } );
            
            
            it( "can be initialized with milliseconds", function() {
                var myTimespan = new root.models.timespan( milliseconds = 86400000 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
            it( "can be initialized with seconds", function() {
                var myTimespan = new root.models.timespan( seconds = 86400 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
            it( "can be initialized with minutes", function() {
                var myTimespan = new root.models.timespan( minutes = 1440 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
            it( "can be initialized with hours", function() {
                var myTimespan = new root.models.timespan( hours = 24 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
            it( "can be initialized with days", function() {
                var myTimespan = new root.models.timespan( days = 1 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
        } );
    }

}
