-module(filter_inno_seconds_to_time).
-export([
          inno_seconds_to_time/2,
          inno_seconds_to_time/3
]).

inno_seconds_to_time(Seconds, _Context) ->
    case Seconds of
        'undefined' -> <<"00:00">>;
        _ ->
            {Hours,Minutes,_} = calendar:seconds_to_time(z_convert:to_integer(Seconds)),
            z_convert:to_binary(io_lib:format("~2..0w:~2..0w",[Hours, Minutes]))
    end.

inno_seconds_to_time(Seconds, _Args, _Context) ->
    case Seconds of
        'undefined' -> <<"00:00">>;
        _ ->
            {Hours,Minutes,_} = calendar:seconds_to_time(z_convert:to_integer(Seconds)),
            z_convert:to_binary(io_lib:format("~2..0w:~2..0w",[Hours, Minutes]))
    end.
