## Copyright (C) 2019, 2023, 2024 Andrew Janke <floss@apjanke.net>
##
## This file is part of Tablicious.
##
## Octave is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function} {@var{out} =} iscalendarduration (@var{x})
##
## True if input is a @code{calendarDuration} array, false otherwise.
##
## Respects @code{iscalendarduration} override methods on user-defined classes, even if
## they do not inherit from @code{calendarDuration} or were known to Tablicious at
## authoring time.
##
## Returns a scalar logical.
##
## @end deftypefn

function out = iscalendarduration (x)
  #ISCALENDARDURATION True if input is a calendar duration array

  # Developer note: see istable for an explanation of this logic.
  if isa (x, 'calendarDuration')
    out = true;
  elseif isobject (x)
    # Respect iscalendarduration methods on classes.
    if ismember ('iscalendarduration', methods (x))
      out = iscalendarduration (x);
    else
      out = false;
    endif
  else
    out = false;
  endif
endfunction
