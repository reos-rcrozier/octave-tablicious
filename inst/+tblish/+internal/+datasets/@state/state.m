## Copyright (C) 1995-2007 R Core Team
## Copyright (C) 2019, 2023, 2024 Andrew Janke
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful, ...
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; If not, see <http://www.gnu.org/licenses/>.

# This is based on the state dataset from R’s datasets package

classdef state < tblish.internal.dataset

  methods

    function this = state
      this.name = "state";
      this.summary = "US State Facts and Figures";
    endfunction

    function out = load (this)
      abb = string ({"AL", "AK", "AZ", "AR", "CA", ...
        "CO", "CT", "DE", "FL", "GA", ...
        "HI", "ID", "IL", "IN", "IA", ...
        "KS", "KY", "LA", "ME", "MD", ...
        "MA", "MI", "MN", "MS", "MO", ...
        "MT", "NE", "NV", "NH", "NJ", ...
        "NM", "NY", "NC", "ND", "OH", ...
        "OK", "OR", "PA", "RI", "SC", ...
        "SD", "TN", "TX", "UT", "VT", ...
        "VA", "WA", "WV", "WI", "WY"}');
      name = string ({"Alabama", "Alaska", "Arizona", "Arkansas", "California", ...
        "Colorado","Connecticut", "Delaware", "Florida", "Georgia", ...
        "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", ...
        "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", ...
        "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", ...
        "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", ...
        "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", ...
        "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", ...
        "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", ...
        "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"}');
      area = [51609, 589757, 113909, 53104, 158693, 104247, 5009, 2057, 58560, 58876, ...
        6450, 83557, 56400, 36291, 56290, 82264, 40395, 48523, 33215, 10577, 8257, ...
        58216, 84068, 47716, 69686, 147138, 77227, 110540, 9304, 7836, 121666, ...
        49576, 52586, 70665, 41222, 69919, 96981, 45333, 1214, 31055, 77047, 42244, ...
        267339, 84916, 9609, 40815, 68192, 24181, 56154, 97914]';

      lat =[-86.7509, -127.25, -111.625, -92.2992, -119.773, -105.513, ...
           -72.3573, -74.9841, -81.685, -83.3736, -126.25, -113.93, ...
           -89.3776, -86.0808, -93.3714, -98.1156, -84.7674, -92.2724, ...
           -68.9801, -76.6459, -71.58, -84.687, -94.6043, -89.8065, ...
           -92.5137, -109.32, -99.5898, -116.851, -71.3924, -74.2336, ...
           -105.942, -75.1449, -78.4686, -100.099, -82.5963, -97.1239, ...
           -120.068, -77.45, -71.1244, -80.5056, -99.7238, -86.456, ...
           -98.7857, -111.33, -72.545, -78.2005, -119.746, -80.6665, ...
           -89.9941, -107.256]';
      lon = [32.5901, 49.25, 34.2192, 34.7336, 36.5341, 38.6777, 41.5928, ...
           38.6777, 27.8744, 32.3329, 31.75, 43.5648, 40.0495, 40.0495, ...
           41.9358, 38.4204, 37.3915, 30.6181, 45.6226, 39.2778, ...
           42.3645, 43.1361, 46.3943, 32.6758, 38.3347, 46.823, 41.3356, ...
           39.1063, 43.3934, 39.9637, 34.4764, 43.1361, 35.4195, ...
           47.2517, 40.221, 35.5053, 43.9078, 40.9069, 41.5928, 33.619, ...
           44.3365, 35.6767, 31.3897, 39.1063, 44.2508, 37.563, 47.4231, ...
           38.4204, 44.5937, 43.0504]';
      state_centers = table (lat, lon);

      division = categorical ([4, 9, 8, 5, 9, 8, 1, 3, 3, 3, 9, 8, 6, 6, 7, 7, 4, 5, ...
        1, 3, 1, 6, 7, 4, 7, 8, 7, 8, 1, 2, 8, 2, 3, 7, 6, 5, 9, 2, 1, 3, 7, 4, ...
        5, 8, 1, 3, 9, 3, 6, 8]', 1:9, ...
        {"New England", "Middle Atlantic", "South Atlantic", ...
        "East South Central", "West South Central", "East North Central", ...
        "West North Central", "Mountain", "Pacific"});
      region = categorical ([2, 4, 4, 2, 4, 4, 1, 2, 2, 2, 4, 4, 3, 3, 3, 3, 2, 2, ...
        1, 2, 1, 3, 3, 2, 3, 4, 3, 4, 1, 1, 4, 1, 2, 3, 3, 2, 4, 1, 1, 2, 3, 2, ...
        2, 4, 1, 2, 4, 2, 3, 4]', 1:4, ...
        {"Northeast", "South", "North Central", "West"});

      x77 = [3615, 365, 2212, 2110, 21198, 2541, 3100, 579, 8277, 4931, ...
        868, 813, 11197, 5313, 2861, 2280, 3387, 3806, 1058, 4122, ...
        5814, 9111, 3921, 2341, 4767, 746, 1544, 590, 812, 7333, ...
        1144, 18076, 5441, 637, 10735, 2715, 2284, 11860, 931, 2816, ...
        681, 4173, 12237, 1203, 472, 4981, 3559, 1799, 4589, 376, ...
        3624, 6315, 4530, 3378, 5114, 4884, 5348, 4809, 4815, 4091, ...
        4963, 4119, 5107, 4458, 4628, 4669, 3712, 3545, 3694, 5299, ...
        4755, 4751, 4675, 3098, 4254, 4347, 4508, 5149, 4281, 5237, ...
        3601, 4903, 3875, 5087, 4561, 3983, 4660, 4449, 4558, 3635, ...
        4167, 3821, 4188, 4022, 3907, 4701, 4864, 3617, 4468, 4566, ...
        2.1, 1.5, 1.8, 1.9, 1.1, 0.7, 1.1, 0.9, 1.3, 2, 1.9, 0.6, ...
        0.9, 0.7, 0.5, 0.6, 1.6, 2.8, 0.7, 0.9, 1.1, 0.9, 0.6, 2.4, ...
        0.8, 0.6, 0.6, 0.5, 0.7, 1.1, 2.2, 1.4, 1.8, 0.8, 0.8, 1.1, ...
        0.6, 1, 1.3, 2.3, 0.5, 1.7, 2.2, 0.6, 0.6, 1.4, 0.6, 1.4, ...
        0.7, 0.6, 69.05, 69.31, 70.55, 70.66, 71.71, 72.06, 72.48, ...
        70.06, 70.66, 68.54, 73.6, 71.87, 70.14, 70.88, 72.56, ...
        72.58, 70.1, 68.76, 70.39, 70.22, 71.83, 70.63, 72.96, ...
        68.09, 70.69, 70.56, 72.6, 69.03, 71.23, 70.93, 70.32, ...
        70.55, 69.21, 72.78, 70.82, 71.42, 72.13, 70.43, 71.9, ...
        67.96, 72.08, 70.11, 70.9, 72.9, 71.64, 70.08, 71.72, 69.48, ...
        72.48, 70.29, 15.1, 11.3, 7.8, 10.1, 10.3, 6.8, 3.1, 6.2, ...
        10.7, 13.9, 6.2, 5.3, 10.3, 7.1, 2.3, 4.5, 10.6, 13.2, 2.7, ...
        8.5, 3.3, 11.1, 2.3, 12.5, 9.3, 5, 2.9, 11.5, 3.3, 5.2, 9.7, ...
        10.9, 11.1, 1.4, 7.4, 6.4, 4.2, 6.1, 2.4, 11.6, 1.7, 11, ...
        12.2, 4.5, 5.5, 9.5, 4.3, 6.7, 3, 6.9, 41.3, 66.7, 58.1, ...
        39.9, 62.6, 63.9, 56, 54.6, 52.6, 40.6, 61.9, 59.5, 52.6, ...
        52.9, 59, 59.9, 38.5, 42.2, 54.7, 52.3, 58.5, 52.8, 57.6, ...
        41, 48.8, 59.2, 59.3, 65.2, 57.6, 52.5, 55.2, 52.7, 38.5, ...
        50.3, 53.2, 51.6, 60, 50.2, 46.4, 37.8, 53.3, 41.8, 47.4, ...
        67.3, 57.1, 47.8, 63.5, 41.6, 54.5, 62.9, 20, 152, 15, 65, ...
        20, 166, 139, 103, 11, 60, 0, 126, 127, 122, 140, 114, 95, ...
        12, 161, 101, 103, 125, 160, 50, 108, 155, 139, 188, 174, ...
        115, 120, 82, 80, 186, 124, 82, 44, 126, 127, 65, 172, 70, ...
        35, 137, 168, 85, 32, 100, 149, 173, 50708, 566432, 113417, ...
        51945, 156361, 103766, 4862, 1982, 54090, 58073, 6425, ...
        82677, 55748, 36097, 55941, 81787, 39650, 44930, 30920, ...
        9891, 7826, 56817, 79289, 47296, 68995, 145587, 76483, ...
        109889, 9027, 7521, 121412, 47831, 48798, 69273, 40975, ...
        68782, 96184, 44966, 1049, 30225, 75955, 41328, 262134, ...
        82096, 9267, 39780, 66570, 24070, 54464, 97203]';
      x77 = reshape (x77, [50 8]);
      x77 = array2table (x77, "VariableNames", ...
        {"Population", "Income", "Illiteracy", "LifeExp", "Murder", ...
          "HSGrad", "Frost", "Area"});
      x77 = removevars (x77, "Area");
      states = table (abb, name, area, division, region);
      out = [states state_centers x77];

    endfunction

  endmethods

endclassdef
