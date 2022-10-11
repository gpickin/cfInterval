/**
 * Timespan Component
 *
 * Ported from TimeSpan.js library
 * https://github.com/mstum/TimeSpan.js
 *
 */
component name="TimeSpan" {

    variables.version = "1.2";
    // Millisecond-constants
    variables.msecPerSecond = 1000;
    variables.msecPerMinute = 60000;
    variables.msecPerHour = 3600000;
    variables.msecPerDay = 86400000;
    // Internally we store the TimeSpan as Milliseconds
    this.msecs = 0;

    function init(
        numeric milliseconds = 0,
        numeric seconds = 0,
        numeric minutes = 0,
        numeric hours = 0,
        numeric days = 0
    ) {
        // this.msecs = 0;

        // Constructor Logic
        if ( isNumeric( days ) ) {
            this.msecs += ( days * msecPerDay );
        }
        if ( isNumeric( hours ) ) {
            this.msecs += ( hours * msecPerHour );
        }
        if ( isNumeric( minutes ) ) {
            this.msecs += ( minutes * msecPerMinute );
        }
        if ( isNumeric( seconds ) ) {
            this.msecs += ( seconds * msecPerSecond );
        }
        if ( isNumeric( milliseconds ) ) {
            this.msecs += milliseconds;
        }

        return this;
    };


    // Addition Functions
    public function addMilliseconds( numeric milliseconds = 0 ) {
        if ( !isNumeric( milliseconds ) ) {
            return;
        }
        this.msecs += milliseconds;
        return this;
    };
    public function addSeconds( numeric seconds = 0 ) {
        if ( !isNumeric( seconds ) ) {
            return;
        }
        this.msecs += ( seconds * msecPerSecond );
        return this;
    };
    public function addMinutes( numeric minutes = 0 ) {
        if ( !isNumeric( minutes ) ) {
            return;
        }
        this.msecs += ( minutes * msecPerMinute );
        return this;
    };
    public function addHours( numeric hours = 0 ) {
        if ( !isNumeric( hours ) ) {
            return;
        }
        this.msecs += ( hours * msecPerHour );
        return this;
    };
    public function addDays( numeric days = 0 ) {
        if ( !isNumeric( days ) ) {
            return;
        }
        this.msecs += ( days * msecPerDay );
        return this;
    };

    // Subtraction Functions
    public function subtractMilliseconds( numeric milliseconds = 0 ) {
        if ( !isNumeric( milliseconds ) ) {
            return;
        }
        this.msecs -= milliseconds;
        return this;
    };
    public function subtractSeconds( numeric seconds = 0 ) {
        if ( !isNumeric( seconds ) ) {
            return;
        }
        this.msecs -= ( seconds * msecPerSecond );
        return this;
    };
    public function subtractMinutes( numeric minutes = 0 ) {
        if ( !isNumeric( minutes ) ) {
            return;
        }
        this.msecs -= ( minutes * msecPerMinute );
        return this;
    };
    public function subtractHours( numeric hours = 0 ) {
        if ( !isNumeric( hours ) ) {
            return;
        }
        this.msecs -= ( hours * msecPerHour );
        return this;
    };
    public function subtractDays( numeric days = 0 ) {
        if ( !isNumeric( days ) ) {
            return;
        }
        this.msecs -= ( days * msecPerDay );
        return this;
    };

    // Functions to interact with other TimeSpans
    this.isTimeSpan = true;
    public function add( Timespan otherTimeSpan = 0 ) {
        if ( !otherTimeSpan.isTimeSpan ) {
            return;
        }
        this.msecs += otherTimeSpan.totalMilliseconds();
    };
    public function subtract( Timespan otherTimeSpan = 0 ) {
        if ( !otherTimeSpan.isTimeSpan ) {
            return;
        }
        this.msecs -= otherTimeSpan.totalMilliseconds();
    };
    public function equals( Timespan otherTimeSpan = 0 ) {
        if ( !otherTimeSpan.isTimeSpan ) {
            return;
        }
        return this.msecs === otherTimeSpan.totalMilliseconds();
    };

    // Getters
    public function inMilliseconds() {
        return totalMilliseconds( true );
    }
    public function inSeconds() {
        return totalSeconds( true );
    }
    public function inMinutes() {
        return totalMinutes( true );
    }
    public function inHours() {
        return totalHours( true );
    }
    public function inDays() {
        return totalDays( true );
    }

    public function totalMilliseconds( boolean roundDown = false ) {
        var result = this.msecs;
        if ( roundDown == true ) {
            result = floor( result );
        }
        return result;
    };

    public function totalSeconds( boolean roundDown = false ) {
        var result = this.msecs / msecPerSecond;
        if ( roundDown == true ) {
            result = floor( result );
        }
        return result;
    };
    public function totalMinutes( boolean roundDown = false ) {
        var result = this.msecs / msecPerMinute;
        if ( roundDown == true ) {
            result = floor( result );
        }
        return result;
    };
    public function totalHours( boolean roundDown = false ) {
        var result = this.msecs / msecPerHour;
        if ( roundDown == true ) {
            result = floor( result );
        }
        return result;
    };
    public function totalDays( boolean roundDown = false ) {
        var result = this.msecs / msecPerDay;
        if ( roundDown == true ) {
            result = floor( result );
        }
        return result;
    };

    // Return a Fraction of the TimeSpan
    public numeric function milliseconds() {
        return this.msecs;
    };
    public numeric function seconds() {
        return floor( this.msecs / msecPerSecond ) % 60;
    };
    public numeric function minutes() {
        return floor( this.msecs / msecPerMinute ) % 60;
    };
    public numeric function hours() {
        return floor( this.msecs / msecPerHour ) % 24;
    };
    public numeric function days() {
        return floor( this.msecs / msecPerDay );
    };

    // Misc. Functions
    public numeric function getVersion() {
        return version;
    };
    // toString use this format "hh:mm.dd"
    public function toString() {
        var text = "";
        var negative = false;
        if ( this.msecs < 0 ) {
            negative = true;
            text &= "-";
            this.msecs = abs( this.msecs )
        }
        text &= this.to2Digits( floor( this.totalHours() ) ) & ":" & this.to2Digits( this.minutes() );
        if ( negative ) this.msecs *= -1;
        return text;
    };
    public function to2Digits( n ) {
        if ( n < 10 ) return "0" & n;
        return n;
    };

    // "Static Constructors"
    public static function FromSeconds( seconds ) {
        return new Timespan( 0, seconds, 0, 0, 0 );
    };
    public static function FromMinutes( minutes ) {
        return new Timespan( 0, 0, minutes, 0, 0 );
    };
    public static function FromHours( hours ) {
        return new Timespan( 0, 0, 0, hours, 0 );
    };
    public static function FromDays( days ) {
        return new Timespan( 0, 0, 0, 0, days );
    };
    public static function FromDates( date firstDate = now(), date secondDate = now(), boolean forcePositive = false ) {
        var differenceMsecs = ( secondDate - firstDate ) * 1000;
        if ( forcePositive === true ) {
            differenceMsecs = abs( differenceMsecs );
        }
        return new Timespan( differenceMsecs, 0, 0, 0, 0 );
    };
    public static function Parse( timespanText ) {
        var tokens = listToArray( timespanText, ":" );
        var days = listToArray( tokens[ 1 ], "." );
        if ( days.length == 2 )
            return init(
                0,
                tokens[ 3 ],
                tokens[ 2 ],
                days[ 2 ],
                days[ 1 ]
            );

        return new Timespan(
            0,
            tokens[ 3 ],
            tokens[ 2 ],
            tokens[ 1 ],
            0
        );
    }

}
