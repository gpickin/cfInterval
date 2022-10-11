component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function beforeAll() {
        super.beforeAll();
    }

    function run() {
        describe( "TimeSpan Initialization", function() {
            beforeEach(function( currentSpec ) {
                variables.ts = getWireBox().getInstance( "timespan@cfInterval" );
            });
            it( "can be initialized with milliseconds", function() {
                var myTimespan = ts.init( milliseconds = 86400000 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
            it( "can be initialized with seconds", function() {
                var myTimespan = ts.init( seconds = 86400 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
            it( "can be initialized with minutes", function() {
                var myTimespan = ts.init( minutes = 1440 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
            it( "can be initialized with hours", function() {
                var myTimespan = ts.init( hours = 24 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
            it( "can be initialized with days", function() {
                var myTimespan = ts.init( days = 1 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
        } );
    }

}
