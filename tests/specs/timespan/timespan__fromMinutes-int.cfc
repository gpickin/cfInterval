component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function beforeAll() {
        super.beforeAll();
        
    }

    function run() {
        describe( "TimeSpan Initialization", function() {
            beforeEach(function( currentSpec ) {
                variables.ts = getWireBox().getInstance( "timespan@cfInterval" );
            });

            it( "can be initialized with minutes via named arguments", function() {
                var myTimespan = ts.fromMinutes( minutes = 1440 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
            it( "can be initialized with minutes via ordered arguments", function() {
                var myTimespan = ts.fromMinutes( minutes = 1440 );
                expect( myTimespan.totalMilliseconds() ).toBe( 86400000 );
                expect( myTimespan.totalSeconds() ).toBe( 86400 );
                expect( myTimespan.totalMinutes() ).toBe( 1440 );
                expect( myTimespan.totalHours() ).toBe( 24 );
                expect( myTimespan.totalDays() ).toBe( 1 );
            } );
        } );
    }

}
