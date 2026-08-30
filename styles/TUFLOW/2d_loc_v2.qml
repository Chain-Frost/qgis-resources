<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.38.3-Grenoble" styleCategories="Symbology|Labeling" labelsEnabled="1">
  <renderer-v2 type="singleSymbol" symbollevels="0" forceraster="0" enableorderby="0" referencescale="-1">
    <symbols>
      <symbol type="fill" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" id="{a045fc42-7500-43dd-9b58-1f8b57d0047b}" enabled="1" class="GeometryGenerator" locked="0">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="collect_geometries(&#13;&#10;  array_filter(&#13;&#10;    array_foreach(&#13;&#10;      generate_series(1, num_points(geometry($currentfeature)) - 1),&#13;&#10;      with_variable(&#13;&#10;        'i',&#13;&#10;        @element,&#13;&#10;        if (&#13;&#10;          NOT (&#13;&#10;            x(point_n(geometry($currentfeature), @i)) = x(point_n(geometry($currentfeature), @i + 1)) OR&#13;&#10;            y(point_n(geometry($currentfeature), @i)) = y(point_n(geometry($currentfeature), @i + 1))&#13;&#10;          ),&#13;&#10;          make_line(point_n(geometry($currentfeature), @i), point_n(geometry($currentfeature), @i + 1)),&#13;&#10;          NULL&#13;&#10;        )&#13;&#10;      )&#13;&#10;    ),&#13;&#10;    @element is not NULL&#13;&#10;  )&#13;&#10;)&#13;&#10;" name="geometryModifier"/>
            <Option type="QString" value="MapUnit" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol type="line" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="@0@0" alpha="1" renderer_should_use_levels="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" id="{6049a6eb-53c8-48a1-af48-7480c308aa67}" enabled="1" class="SimpleLine" locked="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="round" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="round" name="joinstyle"/>
                <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="2.06" name="line_width"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" id="{4968d56e-3aa7-4303-8651-16ed7f7867ab}" enabled="1" class="SimpleLine" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="round" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="round" name="joinstyle"/>
                <Option type="QString" value="255,101,245,255,hsv:0.84444444444444444,0.60392156862745094,1,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1.46" name="line_width"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer pass="0" id="{dd7ffdaa-1cf3-4356-b0e2-f78bde43682c}" enabled="1" class="GeometryGenerator" locked="0">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="collect_geometries(&#13;&#10;  array_filter(&#13;&#10;    array_foreach(&#13;&#10;      generate_series(1, num_points(geometry($currentfeature)) - 1),&#13;&#10;      with_variable(&#13;&#10;        'i',&#13;&#10;        @element,&#13;&#10;        if (&#13;&#10;          x(point_n(geometry($currentfeature), @i)) = x(point_n(geometry($currentfeature), @i + 1)) OR&#13;&#10;          y(point_n(geometry($currentfeature), @i)) = y(point_n(geometry($currentfeature), @i + 1)),&#13;&#10;          make_line(point_n(geometry($currentfeature), @i), point_n(geometry($currentfeature), @i + 1)),&#13;&#10;          NULL&#13;&#10;        )&#13;&#10;      )&#13;&#10;    ),&#13;&#10;    @element is not NULL&#13;&#10;  )&#13;&#10;)&#13;&#10;" name="geometryModifier"/>
            <Option type="QString" value="MapUnit" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol type="line" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="@0@1" alpha="1" renderer_should_use_levels="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" id="{b0562076-f187-4312-8bba-ffbf95d908bc}" enabled="1" class="SimpleLine" locked="1">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="round" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="round" name="joinstyle"/>
                <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="2.06" name="line_width"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" id="{48c3561d-be86-4c0f-8d0f-f3009d380599}" enabled="1" class="SimpleLine" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="round" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="round" name="joinstyle"/>
                <Option type="QString" value="97,255,123,255,hsv:0.3611111111111111,0.61960784313725492,1,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1.46" name="line_width"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer id="{2a853ab1-2b29-4277-9330-86da344bbce2}" enabled="1" locked="0" pass="0" class="GeometryGenerator">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="with_variable(&#10;  'g', geometry($currentfeature),&#10;  with_variable(&#10;    'r', exterior_ring(@g),&#10;    with_variable(&#10;      'p1', point_n(@r, 1),&#10;      with_variable(&#10;        'p2', point_n(@r, 2),&#10;        with_variable(&#10;          'p3', point_n(@r, 3),&#10;          with_variable(&#10;            'p4', point_n(@r, 4),&#10;            with_variable(&#10;  'l12', distance(@p1, @p2),&#10;  with_variable(&#10;    'l14', distance(@p1, @p4),&#10;    with_variable(&#10;      'dot',&#10;      (x(@p2)-x(@p1))*(x(@p4)-x(@p1)) +&#10;      (y(@p2)-y(@p1))*(y(@p4)-y(@p1)),&#10;      with_variable(&#10;        'p3_expected',&#10;        make_point(&#10;          x(@p2) + x(@p4) - x(@p1),&#10;          y(@p2) + y(@p4) - y(@p1)&#10;        ),&#10;        with_variable(&#10;          'rectangle_ok',&#10;          coalesce(&#10;            num_points(@r) = 5&#10;            AND num_rings(@g) = 1&#10;            AND @l12 &gt; 0&#10;            AND @l14 &gt; 0&#10;            AND abs(@dot) &lt;= 0.001 * @l12 * @l14&#10;            AND distance(@p3, @p3_expected) &lt;= 0.001,&#10;            false&#10;          ),&#10;          with_variable(&#10;            'axis_aligned',&#10;            coalesce(&#10;              num_points(@r) = 5&#10;              AND (x(@p1)=x(@p2) OR y(@p1)=y(@p2))&#10;              AND (x(@p2)=x(@p3) OR y(@p2)=y(@p3))&#10;              AND (x(@p3)=x(@p4) OR y(@p3)=y(@p4))&#10;              AND (x(@p4)=x(@p1) OR y(@p4)=y(@p1)),&#10;              false&#10;            ),&#10;            with_variable(&#10;              'clockwise_ok',&#10;              coalesce(&#10;                num_points(@r) = 5&#10;                AND (&#10;                  x(@p1)*y(@p2) - y(@p1)*x(@p2)&#10;                  + x(@p2)*y(@p3) - y(@p2)*x(@p3)&#10;                  + x(@p3)*y(@p4) - y(@p3)*x(@p4)&#10;                  + x(@p4)*y(@p1) - y(@p4)*x(@p1)&#10;                ) &lt; 0,&#10;                false&#10;              ),&#10;              with_variable(&#10;                'lower_left_ok',&#10;                coalesce(&#10;                  num_points(@r) = 5&#10;                  AND x(@p1) &lt;= x(@p2)&#10;                  AND x(@p1) &lt;= x(@p3)&#10;                  AND x(@p1) &lt;= x(@p4)&#10;                  AND y(@p1) &lt;= y(@p2)&#10;                  AND y(@p1) &lt;= y(@p3)&#10;                  AND y(@p1) &lt;= y(@p4),&#10;                  false&#10;                ),&#10;                if(@rectangle_ok AND NOT @axis_aligned, boundary(@g), NULL)&#10;              )&#10;            )&#10;          )&#10;        )&#10;      )&#10;    )&#10;  )&#10;)&#10;          )&#10;        )&#10;      )&#10;    )&#10;  )&#10;)" name="geometryModifier"/>
            <Option type="QString" value="MapUnit" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol type="line" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="@0@qa" alpha="1" renderer_should_use_levels="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer id="{9fba9d60-1ea4-4b81-ae84-7529810e4112}" enabled="1" locked="0" pass="0" class="SimpleLine">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="round" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="round" name="joinstyle"/>
                <Option type="QString" value="0,0,0,255,rgb:0,0,0,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="2.06" name="line_width"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer id="{6f257908-0489-4eaf-a94f-f24ee91712bf}" enabled="1" locked="0" pass="0" class="SimpleLine">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="round" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="round" name="joinstyle"/>
                <Option type="QString" value="0,210,255,255,rgb:0,0.8235294118,1,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="1.46" name="line_width"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer id="{18a3d6f6-b1ee-4508-9f18-b4b255a79381}" enabled="1" locked="0" pass="0" class="GeometryGenerator">
          <Option type="Map">
            <Option type="QString" value="Line" name="SymbolType"/>
            <Option type="QString" value="with_variable(&#10;  'g', geometry($currentfeature),&#10;  with_variable(&#10;    'r', exterior_ring(@g),&#10;    with_variable(&#10;      'p1', point_n(@r, 1),&#10;      with_variable(&#10;        'p2', point_n(@r, 2),&#10;        with_variable(&#10;          'p3', point_n(@r, 3),&#10;          with_variable(&#10;            'p4', point_n(@r, 4),&#10;            with_variable(&#10;  'l12', distance(@p1, @p2),&#10;  with_variable(&#10;    'l14', distance(@p1, @p4),&#10;    with_variable(&#10;      'dot',&#10;      (x(@p2)-x(@p1))*(x(@p4)-x(@p1)) +&#10;      (y(@p2)-y(@p1))*(y(@p4)-y(@p1)),&#10;      with_variable(&#10;        'p3_expected',&#10;        make_point(&#10;          x(@p2) + x(@p4) - x(@p1),&#10;          y(@p2) + y(@p4) - y(@p1)&#10;        ),&#10;        with_variable(&#10;          'rectangle_ok',&#10;          coalesce(&#10;            num_points(@r) = 5&#10;            AND num_rings(@g) = 1&#10;            AND @l12 &gt; 0&#10;            AND @l14 &gt; 0&#10;            AND abs(@dot) &lt;= 0.001 * @l12 * @l14&#10;            AND distance(@p3, @p3_expected) &lt;= 0.001,&#10;            false&#10;          ),&#10;          with_variable(&#10;            'axis_aligned',&#10;            coalesce(&#10;              num_points(@r) = 5&#10;              AND (x(@p1)=x(@p2) OR y(@p1)=y(@p2))&#10;              AND (x(@p2)=x(@p3) OR y(@p2)=y(@p3))&#10;              AND (x(@p3)=x(@p4) OR y(@p3)=y(@p4))&#10;              AND (x(@p4)=x(@p1) OR y(@p4)=y(@p1)),&#10;              false&#10;            ),&#10;            with_variable(&#10;              'clockwise_ok',&#10;              coalesce(&#10;                num_points(@r) = 5&#10;                AND (&#10;                  x(@p1)*y(@p2) - y(@p1)*x(@p2)&#10;                  + x(@p2)*y(@p3) - y(@p2)*x(@p3)&#10;                  + x(@p3)*y(@p4) - y(@p3)*x(@p4)&#10;                  + x(@p4)*y(@p1) - y(@p4)*x(@p1)&#10;                ) &lt; 0,&#10;                false&#10;              ),&#10;              with_variable(&#10;                'lower_left_ok',&#10;                coalesce(&#10;                  num_points(@r) = 5&#10;                  AND x(@p1) &lt;= x(@p2)&#10;                  AND x(@p1) &lt;= x(@p3)&#10;                  AND x(@p1) &lt;= x(@p4)&#10;                  AND y(@p1) &lt;= y(@p2)&#10;                  AND y(@p1) &lt;= y(@p3)&#10;                  AND y(@p1) &lt;= y(@p4),&#10;                  false&#10;                ),&#10;                if(@rectangle_ok AND @clockwise_ok AND (NOT @axis_aligned OR @lower_left_ok), NULL, boundary(@g))&#10;              )&#10;            )&#10;          )&#10;        )&#10;      )&#10;    )&#10;  )&#10;)&#10;          )&#10;        )&#10;      )&#10;    )&#10;  )&#10;)" name="geometryModifier"/>
            <Option type="QString" value="MapUnit" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol type="line" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="@0@qa" alpha="1" renderer_should_use_levels="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer id="{3d12b3c7-19d3-41b7-9df4-6b782c212fa0}" enabled="1" locked="0" pass="0" class="SimpleLine">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="round" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="round" name="joinstyle"/>
                <Option type="QString" value="45,0,0,255,rgb:0.1764705882,0,0,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="4.0" name="line_width"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer id="{dd39f0e1-71ee-4f0a-8270-4c42c5e73841}" enabled="1" locked="0" pass="0" class="SimpleLine">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="round" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="round" name="joinstyle"/>
                <Option type="QString" value="255,0,0,255,rgb:1,0,0,1" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="3.2" name="line_width"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer id="{5770bf5a-eb79-4190-b885-43792e663952}" enabled="1" locked="0" pass="0" class="GeometryGenerator">
          <Option type="Map">
            <Option type="QString" value="Marker" name="SymbolType"/>
            <Option type="QString" value="point_n(exterior_ring(geometry($currentfeature)), 1)" name="geometryModifier"/>
            <Option type="QString" value="MapUnit" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="@0@v1" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" id="{64e42de9-a163-49d0-8ba1-2888a63ba6eb}" enabled="1" class="FontMarker" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="1" name="chr"/>
                <Option type="QString" value="255,255,255,255,hsv:0,0,1,1" name="color"/>
                <Option type="QString" value="Arial" name="font"/>
                <Option type="QString" value="Bold" name="font_style"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="255,255,255,255,hsv:0,0,1,1" name="outline_color"/>
                <Option type="QString" value="1" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="8" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" id="{fcfa6cb0-1a49-4615-94e4-5c3b0ccd29c6}" enabled="1" class="FontMarker" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="1" name="chr"/>
                <Option type="QString" value="255,0,0,255,rgb:1,0,0,1" name="color"/>
                <Option type="QString" value="Arial" name="font"/>
                <Option type="QString" value="Bold" name="font_style"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="outline_color"/>
                <Option type="QString" value="0.25" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="8" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer id="{eb17875b-312d-47a3-92ab-69d9f5fa3510}" enabled="1" locked="0" pass="0" class="GeometryGenerator">
          <Option type="Map">
            <Option type="QString" value="Marker" name="SymbolType"/>
            <Option type="QString" value="point_n(exterior_ring(geometry($currentfeature)), 2)" name="geometryModifier"/>
            <Option type="QString" value="MapUnit" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="@0@v2" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" id="{c872451e-0807-4270-bfd5-36c81e1d88e3}" enabled="1" class="FontMarker" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="2" name="chr"/>
                <Option type="QString" value="255,255,255,255,hsv:0,0,1,1" name="color"/>
                <Option type="QString" value="Arial" name="font"/>
                <Option type="QString" value="Bold" name="font_style"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="255,255,255,255,hsv:0,0,1,1" name="outline_color"/>
                <Option type="QString" value="1" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="8" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" id="{8da230b0-f676-40d2-92bc-bf681ffdd0da}" enabled="1" class="FontMarker" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="2" name="chr"/>
                <Option type="QString" value="255,0,0,255,rgb:1,0,0,1" name="color"/>
                <Option type="QString" value="Arial" name="font"/>
                <Option type="QString" value="Bold" name="font_style"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="outline_color"/>
                <Option type="QString" value="0.25" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="8" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer id="{5987d758-84be-460b-8ee9-d6b7f477cbaf}" enabled="1" locked="0" pass="0" class="GeometryGenerator">
          <Option type="Map">
            <Option type="QString" value="Marker" name="SymbolType"/>
            <Option type="QString" value="point_n(exterior_ring(geometry($currentfeature)), 3)" name="geometryModifier"/>
            <Option type="QString" value="MapUnit" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="@0@v3" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" id="{222e6db1-1f5c-4513-a4b4-a3327ea0bc39}" enabled="1" class="FontMarker" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="3" name="chr"/>
                <Option type="QString" value="255,255,255,255,hsv:0,0,1,1" name="color"/>
                <Option type="QString" value="Arial" name="font"/>
                <Option type="QString" value="Bold" name="font_style"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="255,255,255,255,hsv:0,0,1,1" name="outline_color"/>
                <Option type="QString" value="1" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="8" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" id="{b980d591-8ba0-4203-a571-e38784a2b79b}" enabled="1" class="FontMarker" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="3" name="chr"/>
                <Option type="QString" value="255,0,0,255,rgb:1,0,0,1" name="color"/>
                <Option type="QString" value="Arial" name="font"/>
                <Option type="QString" value="Bold" name="font_style"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="outline_color"/>
                <Option type="QString" value="0.25" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="8" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer id="{26b243d7-6360-47e5-8cdf-72a4d5b26078}" enabled="1" locked="0" pass="0" class="GeometryGenerator">
          <Option type="Map">
            <Option type="QString" value="Marker" name="SymbolType"/>
            <Option type="QString" value="point_n(exterior_ring(geometry($currentfeature)), 4)" name="geometryModifier"/>
            <Option type="QString" value="MapUnit" name="units"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="@0@v4" alpha="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" id="{bcd4dab0-006a-490d-b6dc-a12682c6cc4e}" enabled="1" class="FontMarker" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="4" name="chr"/>
                <Option type="QString" value="255,255,255,255,hsv:0,0,1,1" name="color"/>
                <Option type="QString" value="Arial" name="font"/>
                <Option type="QString" value="Bold" name="font_style"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="255,255,255,255,hsv:0,0,1,1" name="outline_color"/>
                <Option type="QString" value="1" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="8" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" id="{43096edf-b43f-4eee-a83f-5d27d43bfcae}" enabled="1" class="FontMarker" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="4" name="chr"/>
                <Option type="QString" value="255,0,0,255,rgb:1,0,0,1" name="color"/>
                <Option type="QString" value="Arial" name="font"/>
                <Option type="QString" value="Bold" name="font_style"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="outline_color"/>
                <Option type="QString" value="0.25" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="8" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
    <data-defined-properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </data-defined-properties>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{ce335cc0-3c2c-4f36-b834-fd0d0f111713}">
      <rule key="{f5e98e90-c731-43e5-ae33-360d7971ea4b}" description="TUFLOW vertex 1 — origin" filter="coalesce(num_points(exterior_ring(geometry($currentfeature))) &gt;= 5, false)">
        <settings calloutType="simple">
          <text-style fontWeight="75" tabStopDistanceUnit="Point" useSubstitutions="0" textColor="20,20,20,255,rgb:0.0784313725,0.0784313725,0.0784313725,1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" fontSize="8" fontKerning="1" blendMode="0" fontStrikeout="0" forcedBold="0" allowHtml="0" namedStyle="Bold" isExpression="1" fontLetterSpacing="0" multilineHeight="1.15" textOpacity="1" fontUnderline="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontItalic="0" forcedItalic="0" capitalization="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" textOrientation="horizontal" fontSizeUnit="Point" multilineHeightUnit="Percentage" fieldName="'1 — ORIGIN' || '\n' || 'Bottom-left'" fontFamily="Arial" fontWordSpacing="0" tabStopDistance="80">
            <families/>
            <text-buffer bufferDraw="1" bufferSizeUnits="MM" bufferBlendMode="0" bufferSize="1.2" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="0" bufferOpacity="0.92" bufferJoinStyle="128" bufferColor="255,255,255,255,rgb:1,1,1,1"/>
            <text-mask maskSize="1.5" maskSize2="1.5" maskSizeUnits="MM" maskedSymbolLayers="" maskJoinStyle="128" maskEnabled="0" maskOpacity="1" maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeBorderWidthUnit="Point" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="Point" shapeSizeY="0" shapeOffsetY="0" shapeRadiiX="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeJoinStyle="64" shapeRotation="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeOpacity="1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeSizeType="0" shapeRotationType="0" shapeSVGFile="" shapeBlendMode="0" shapeOffsetX="0" shapeRadiiY="0" shapeType="0" shapeOffsetUnit="Point" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeSizeX="0" shapeDraw="0">
              <symbol type="marker" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="markerSymbol" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" id="" enabled="1" class="SimpleMarker" locked="0">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="232,113,141,255,rgb:0.90980392156862744,0.44313725490196076,0.55294117647058827,1" name="color"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="circle" name="name"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="MM" name="outline_width_unit"/>
                    <Option type="QString" value="diameter" name="scale_method"/>
                    <Option type="QString" value="2" name="size"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                    <Option type="QString" value="MM" name="size_unit"/>
                    <Option type="QString" value="1" name="vertical_anchor_point"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol type="fill" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="fillSymbol" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" id="" enabled="1" class="SimpleFill" locked="0">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" name="outline_color"/>
                    <Option type="QString" value="no" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="Point" name="outline_width_unit"/>
                    <Option type="QString" value="solid" name="style"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowRadiusUnit="MM" shadowBlendMode="6" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetDist="1" shadowScale="100" shadowUnder="0" shadowRadius="1.5"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format autoWrapLength="0" useMaxLineLengthForAutoWrap="1" wrapChar="" decimals="3" plussign="0" leftDirectionSymbol="&lt;" multilineAlign="3" formatNumbers="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" addDirectionSymbol="0" rightDirectionSymbol="&gt;"/>
          <placement overlapHandling="AllowOverlapAtNoCost" rotationUnit="AngleDegrees" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" overrunDistance="0" overrunDistanceUnit="MM" preserveRotation="1" prioritization="PreferCloser" maxCurvedCharAngleIn="25" geometryGeneratorEnabled="1" xOffset="-11" dist="0" lineAnchorTextPoint="FollowPlacement" rotationAngle="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" lineAnchorPercent="0.5" quadOffset="4" layerType="PolygonGeometry" distUnits="MM" centroidWhole="0" lineAnchorClipping="0" maximumDistanceUnit="MM" repeatDistanceUnits="MM" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" allowDegraded="0" lineAnchorType="0" offsetUnits="MM" yOffset="-7" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" polygonPlacementFlags="2" fitInPolygonOnly="0" maximumDistance="0" geometryGenerator="point_n(exterior_ring(geometry($currentfeature)), 1)" placementFlags="10" distMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" geometryGeneratorType="PointGeometry" maxCurvedCharAngleOut="-25" offsetType="0" centroidInside="0" priority="5"/>
          <rendering fontMinPixelSize="3" scaleMax="0" drawLabels="1" obstacleType="1" scaleVisibility="0" upsidedownLabels="0" labelPerPart="0" scaleMin="0" obstacleFactor="1" unplacedVisibility="1" fontMaxPixelSize="10000" maxNumLabels="2000" limitNumLabels="0" minFeatureSize="0" zIndex="10" fontLimitPixelSize="0" obstacle="0" mergeLines="0"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
              <Option type="int" value="0" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
              <Option type="bool" value="false" name="drawToAllParts"/>
              <Option type="QString" value="0" name="enabled"/>
              <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
              <Option type="QString" value="&lt;symbol type=&quot;line&quot; clip_to_extent=&quot;1&quot; frame_rate=&quot;10&quot; force_rhr=&quot;0&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot;&gt;&lt;data_defined_properties&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/&gt;&lt;Option name=&quot;properties&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/&gt;&lt;/Option&gt;&lt;/data_defined_properties&gt;&lt;layer pass=&quot;0&quot; id=&quot;{54214e10-726d-429b-b154-c956f4c1eb1d}&quot; enabled=&quot;1&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/&gt;&lt;/Option&gt;&lt;data_defined_properties&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/&gt;&lt;Option name=&quot;properties&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/&gt;&lt;/Option&gt;&lt;/data_defined_properties&gt;&lt;/layer&gt;&lt;/symbol&gt;" name="lineSymbol"/>
              <Option type="double" value="0" name="minLength"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
              <Option type="QString" value="MM" name="minLengthUnit"/>
              <Option type="double" value="0" name="offsetFromAnchor"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
              <Option type="double" value="0" name="offsetFromLabel"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule key="{b69d771f-9cc7-4d8c-9013-8128ae169a29}" description="TUFLOW vertex 2 — Y extent" filter="coalesce(num_points(exterior_ring(geometry($currentfeature))) &gt;= 5, false)">
        <settings calloutType="simple">
          <text-style fontWeight="75" tabStopDistanceUnit="Point" useSubstitutions="0" textColor="20,20,20,255,rgb:0.0784313725,0.0784313725,0.0784313725,1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" fontSize="8" fontKerning="1" blendMode="0" fontStrikeout="0" forcedBold="0" allowHtml="0" namedStyle="Bold" isExpression="1" fontLetterSpacing="0" multilineHeight="1.15" textOpacity="1" fontUnderline="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontItalic="0" forcedItalic="0" capitalization="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" textOrientation="horizontal" fontSizeUnit="Point" multilineHeightUnit="Percentage" fieldName="'2 — Top-left' || '\n' ||&#10;'Y extent (1→2) = ' ||&#10;format_number(&#10;  distance(&#10;    point_n(exterior_ring(geometry($currentfeature)), 1),&#10;    point_n(exterior_ring(geometry($currentfeature)), 2)&#10;  ), 2&#10;) || ' layer units'" fontFamily="Arial" fontWordSpacing="0" tabStopDistance="80">
            <families/>
            <text-buffer bufferDraw="1" bufferSizeUnits="MM" bufferBlendMode="0" bufferSize="1.2" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="0" bufferOpacity="0.92" bufferJoinStyle="128" bufferColor="255,255,255,255,rgb:1,1,1,1"/>
            <text-mask maskSize="1.5" maskSize2="1.5" maskSizeUnits="MM" maskedSymbolLayers="" maskJoinStyle="128" maskEnabled="0" maskOpacity="1" maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeBorderWidthUnit="Point" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="Point" shapeSizeY="0" shapeOffsetY="0" shapeRadiiX="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeJoinStyle="64" shapeRotation="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeOpacity="1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeSizeType="0" shapeRotationType="0" shapeSVGFile="" shapeBlendMode="0" shapeOffsetX="0" shapeRadiiY="0" shapeType="0" shapeOffsetUnit="Point" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeSizeX="0" shapeDraw="0">
              <symbol type="marker" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="markerSymbol" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" id="" enabled="1" class="SimpleMarker" locked="0">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="232,113,141,255,rgb:0.90980392156862744,0.44313725490196076,0.55294117647058827,1" name="color"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="circle" name="name"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="MM" name="outline_width_unit"/>
                    <Option type="QString" value="diameter" name="scale_method"/>
                    <Option type="QString" value="2" name="size"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                    <Option type="QString" value="MM" name="size_unit"/>
                    <Option type="QString" value="1" name="vertical_anchor_point"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol type="fill" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="fillSymbol" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" id="" enabled="1" class="SimpleFill" locked="0">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" name="outline_color"/>
                    <Option type="QString" value="no" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="Point" name="outline_width_unit"/>
                    <Option type="QString" value="solid" name="style"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowRadiusUnit="MM" shadowBlendMode="6" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetDist="1" shadowScale="100" shadowUnder="0" shadowRadius="1.5"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format autoWrapLength="0" useMaxLineLengthForAutoWrap="1" wrapChar="" decimals="3" plussign="0" leftDirectionSymbol="&lt;" multilineAlign="3" formatNumbers="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" addDirectionSymbol="0" rightDirectionSymbol="&gt;"/>
          <placement overlapHandling="AllowOverlapAtNoCost" rotationUnit="AngleDegrees" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" overrunDistance="0" overrunDistanceUnit="MM" preserveRotation="1" prioritization="PreferCloser" maxCurvedCharAngleIn="25" geometryGeneratorEnabled="1" xOffset="-11" dist="0" lineAnchorTextPoint="FollowPlacement" rotationAngle="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" lineAnchorPercent="0.5" quadOffset="4" layerType="PolygonGeometry" distUnits="MM" centroidWhole="0" lineAnchorClipping="0" maximumDistanceUnit="MM" repeatDistanceUnits="MM" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" allowDegraded="0" lineAnchorType="0" offsetUnits="MM" yOffset="8" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" polygonPlacementFlags="2" fitInPolygonOnly="0" maximumDistance="0" geometryGenerator="point_n(exterior_ring(geometry($currentfeature)), 2)" placementFlags="10" distMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" geometryGeneratorType="PointGeometry" maxCurvedCharAngleOut="-25" offsetType="0" centroidInside="0" priority="5"/>
          <rendering fontMinPixelSize="3" scaleMax="0" drawLabels="1" obstacleType="1" scaleVisibility="0" upsidedownLabels="0" labelPerPart="0" scaleMin="0" obstacleFactor="1" unplacedVisibility="1" fontMaxPixelSize="10000" maxNumLabels="2000" limitNumLabels="0" minFeatureSize="0" zIndex="10" fontLimitPixelSize="0" obstacle="0" mergeLines="0"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
              <Option type="int" value="0" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
              <Option type="bool" value="false" name="drawToAllParts"/>
              <Option type="QString" value="0" name="enabled"/>
              <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
              <Option type="QString" value="&lt;symbol type=&quot;line&quot; clip_to_extent=&quot;1&quot; frame_rate=&quot;10&quot; force_rhr=&quot;0&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot;&gt;&lt;data_defined_properties&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/&gt;&lt;Option name=&quot;properties&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/&gt;&lt;/Option&gt;&lt;/data_defined_properties&gt;&lt;layer pass=&quot;0&quot; id=&quot;{54214e10-726d-429b-b154-c956f4c1eb1d}&quot; enabled=&quot;1&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/&gt;&lt;/Option&gt;&lt;data_defined_properties&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/&gt;&lt;Option name=&quot;properties&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/&gt;&lt;/Option&gt;&lt;/data_defined_properties&gt;&lt;/layer&gt;&lt;/symbol&gt;" name="lineSymbol"/>
              <Option type="double" value="0" name="minLength"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
              <Option type="QString" value="MM" name="minLengthUnit"/>
              <Option type="double" value="0" name="offsetFromAnchor"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
              <Option type="double" value="0" name="offsetFromLabel"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule key="{e45df5e8-e1d3-4c3e-9180-a6d58afa0de5}" description="TUFLOW vertex 3 — unused" filter="coalesce(num_points(exterior_ring(geometry($currentfeature))) &gt;= 5, false)">
        <settings calloutType="simple">
          <text-style fontWeight="50" tabStopDistanceUnit="Point" useSubstitutions="0" textColor="90,90,90,255,rgb:0.3529411765,0.3529411765,0.3529411765,1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" fontSize="7" fontKerning="1" blendMode="0" fontStrikeout="0" forcedBold="0" allowHtml="0" namedStyle="Regular" isExpression="1" fontLetterSpacing="0" multilineHeight="1.15" textOpacity="1" fontUnderline="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontItalic="0" forcedItalic="0" capitalization="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" textOrientation="horizontal" fontSizeUnit="Point" multilineHeightUnit="Percentage" fieldName="'3 — Not used by TUFLOW'" fontFamily="Arial" fontWordSpacing="0" tabStopDistance="80">
            <families/>
            <text-buffer bufferDraw="1" bufferSizeUnits="MM" bufferBlendMode="0" bufferSize="1.0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="0" bufferOpacity="0.92" bufferJoinStyle="128" bufferColor="255,255,255,255,rgb:1,1,1,1"/>
            <text-mask maskSize="1.5" maskSize2="1.5" maskSizeUnits="MM" maskedSymbolLayers="" maskJoinStyle="128" maskEnabled="0" maskOpacity="1" maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeBorderWidthUnit="Point" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="Point" shapeSizeY="0" shapeOffsetY="0" shapeRadiiX="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeJoinStyle="64" shapeRotation="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeOpacity="1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeSizeType="0" shapeRotationType="0" shapeSVGFile="" shapeBlendMode="0" shapeOffsetX="0" shapeRadiiY="0" shapeType="0" shapeOffsetUnit="Point" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeSizeX="0" shapeDraw="0">
              <symbol type="marker" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="markerSymbol" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" id="" enabled="1" class="SimpleMarker" locked="0">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="232,113,141,255,rgb:0.90980392156862744,0.44313725490196076,0.55294117647058827,1" name="color"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="circle" name="name"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="MM" name="outline_width_unit"/>
                    <Option type="QString" value="diameter" name="scale_method"/>
                    <Option type="QString" value="2" name="size"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                    <Option type="QString" value="MM" name="size_unit"/>
                    <Option type="QString" value="1" name="vertical_anchor_point"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol type="fill" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="fillSymbol" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" id="" enabled="1" class="SimpleFill" locked="0">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" name="outline_color"/>
                    <Option type="QString" value="no" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="Point" name="outline_width_unit"/>
                    <Option type="QString" value="solid" name="style"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowRadiusUnit="MM" shadowBlendMode="6" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetDist="1" shadowScale="100" shadowUnder="0" shadowRadius="1.5"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format autoWrapLength="0" useMaxLineLengthForAutoWrap="1" wrapChar="" decimals="3" plussign="0" leftDirectionSymbol="&lt;" multilineAlign="3" formatNumbers="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" addDirectionSymbol="0" rightDirectionSymbol="&gt;"/>
          <placement overlapHandling="AllowOverlapAtNoCost" rotationUnit="AngleDegrees" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" overrunDistance="0" overrunDistanceUnit="MM" preserveRotation="1" prioritization="PreferCloser" maxCurvedCharAngleIn="25" geometryGeneratorEnabled="1" xOffset="10" dist="0" lineAnchorTextPoint="FollowPlacement" rotationAngle="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" lineAnchorPercent="0.5" quadOffset="4" layerType="PolygonGeometry" distUnits="MM" centroidWhole="0" lineAnchorClipping="0" maximumDistanceUnit="MM" repeatDistanceUnits="MM" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" allowDegraded="0" lineAnchorType="0" offsetUnits="MM" yOffset="8" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" polygonPlacementFlags="2" fitInPolygonOnly="0" maximumDistance="0" geometryGenerator="point_n(exterior_ring(geometry($currentfeature)), 3)" placementFlags="10" distMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" geometryGeneratorType="PointGeometry" maxCurvedCharAngleOut="-25" offsetType="0" centroidInside="0" priority="5"/>
          <rendering fontMinPixelSize="3" scaleMax="0" drawLabels="1" obstacleType="1" scaleVisibility="0" upsidedownLabels="0" labelPerPart="0" scaleMin="0" obstacleFactor="1" unplacedVisibility="1" fontMaxPixelSize="10000" maxNumLabels="2000" limitNumLabels="0" minFeatureSize="0" zIndex="9" fontLimitPixelSize="0" obstacle="0" mergeLines="0"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
              <Option type="int" value="0" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
              <Option type="bool" value="false" name="drawToAllParts"/>
              <Option type="QString" value="0" name="enabled"/>
              <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
              <Option type="QString" value="&lt;symbol type=&quot;line&quot; clip_to_extent=&quot;1&quot; frame_rate=&quot;10&quot; force_rhr=&quot;0&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot;&gt;&lt;data_defined_properties&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/&gt;&lt;Option name=&quot;properties&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/&gt;&lt;/Option&gt;&lt;/data_defined_properties&gt;&lt;layer pass=&quot;0&quot; id=&quot;{54214e10-726d-429b-b154-c956f4c1eb1d}&quot; enabled=&quot;1&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/&gt;&lt;/Option&gt;&lt;data_defined_properties&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/&gt;&lt;Option name=&quot;properties&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/&gt;&lt;/Option&gt;&lt;/data_defined_properties&gt;&lt;/layer&gt;&lt;/symbol&gt;" name="lineSymbol"/>
              <Option type="double" value="0" name="minLength"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
              <Option type="QString" value="MM" name="minLengthUnit"/>
              <Option type="double" value="0" name="offsetFromAnchor"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
              <Option type="double" value="0" name="offsetFromLabel"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule key="{392bcf9c-ae01-45b8-bc78-bb7e8f8a9847}" description="TUFLOW vertex 4 — X extent and orientation" filter="coalesce(num_points(exterior_ring(geometry($currentfeature))) &gt;= 5, false)">
        <settings calloutType="simple">
          <text-style fontWeight="75" tabStopDistanceUnit="Point" useSubstitutions="0" textColor="20,20,20,255,rgb:0.0784313725,0.0784313725,0.0784313725,1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" fontSize="8" fontKerning="1" blendMode="0" fontStrikeout="0" forcedBold="0" allowHtml="0" namedStyle="Bold" isExpression="1" fontLetterSpacing="0" multilineHeight="1.15" textOpacity="1" fontUnderline="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontItalic="0" forcedItalic="0" capitalization="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" textOrientation="horizontal" fontSizeUnit="Point" multilineHeightUnit="Percentage" fieldName="'4 — Bottom-right' || '\n' ||&#10;'X extent (1→4) = ' ||&#10;format_number(&#10;  distance(&#10;    point_n(exterior_ring(geometry($currentfeature)), 1),&#10;    point_n(exterior_ring(geometry($currentfeature)), 4)&#10;  ), 2&#10;) || ' layer units' || '\n' ||&#10;'1→4 sets grid orientation'" fontFamily="Arial" fontWordSpacing="0" tabStopDistance="80">
            <families/>
            <text-buffer bufferDraw="1" bufferSizeUnits="MM" bufferBlendMode="0" bufferSize="1.2" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="0" bufferOpacity="0.92" bufferJoinStyle="128" bufferColor="255,255,255,255,rgb:1,1,1,1"/>
            <text-mask maskSize="1.5" maskSize2="1.5" maskSizeUnits="MM" maskedSymbolLayers="" maskJoinStyle="128" maskEnabled="0" maskOpacity="1" maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeBorderWidthUnit="Point" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="Point" shapeSizeY="0" shapeOffsetY="0" shapeRadiiX="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeJoinStyle="64" shapeRotation="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeOpacity="1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeSizeType="0" shapeRotationType="0" shapeSVGFile="" shapeBlendMode="0" shapeOffsetX="0" shapeRadiiY="0" shapeType="0" shapeOffsetUnit="Point" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeSizeX="0" shapeDraw="0">
              <symbol type="marker" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="markerSymbol" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" id="" enabled="1" class="SimpleMarker" locked="0">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="232,113,141,255,rgb:0.90980392156862744,0.44313725490196076,0.55294117647058827,1" name="color"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="circle" name="name"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="MM" name="outline_width_unit"/>
                    <Option type="QString" value="diameter" name="scale_method"/>
                    <Option type="QString" value="2" name="size"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                    <Option type="QString" value="MM" name="size_unit"/>
                    <Option type="QString" value="1" name="vertical_anchor_point"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol type="fill" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="fillSymbol" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" id="" enabled="1" class="SimpleFill" locked="0">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" name="outline_color"/>
                    <Option type="QString" value="no" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="Point" name="outline_width_unit"/>
                    <Option type="QString" value="solid" name="style"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowRadiusUnit="MM" shadowBlendMode="6" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetDist="1" shadowScale="100" shadowUnder="0" shadowRadius="1.5"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format autoWrapLength="0" useMaxLineLengthForAutoWrap="1" wrapChar="" decimals="3" plussign="0" leftDirectionSymbol="&lt;" multilineAlign="3" formatNumbers="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" addDirectionSymbol="0" rightDirectionSymbol="&gt;"/>
          <placement overlapHandling="AllowOverlapAtNoCost" rotationUnit="AngleDegrees" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" overrunDistance="0" overrunDistanceUnit="MM" preserveRotation="1" prioritization="PreferCloser" maxCurvedCharAngleIn="25" geometryGeneratorEnabled="1" xOffset="12" dist="0" lineAnchorTextPoint="FollowPlacement" rotationAngle="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" lineAnchorPercent="0.5" quadOffset="4" layerType="PolygonGeometry" distUnits="MM" centroidWhole="0" lineAnchorClipping="0" maximumDistanceUnit="MM" repeatDistanceUnits="MM" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" allowDegraded="0" lineAnchorType="0" offsetUnits="MM" yOffset="-7" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" polygonPlacementFlags="2" fitInPolygonOnly="0" maximumDistance="0" geometryGenerator="point_n(exterior_ring(geometry($currentfeature)), 4)" placementFlags="10" distMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" geometryGeneratorType="PointGeometry" maxCurvedCharAngleOut="-25" offsetType="0" centroidInside="0" priority="5"/>
          <rendering fontMinPixelSize="3" scaleMax="0" drawLabels="1" obstacleType="1" scaleVisibility="0" upsidedownLabels="0" labelPerPart="0" scaleMin="0" obstacleFactor="1" unplacedVisibility="1" fontMaxPixelSize="10000" maxNumLabels="2000" limitNumLabels="0" minFeatureSize="0" zIndex="10" fontLimitPixelSize="0" obstacle="0" mergeLines="0"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
              <Option type="int" value="0" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
              <Option type="bool" value="false" name="drawToAllParts"/>
              <Option type="QString" value="0" name="enabled"/>
              <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
              <Option type="QString" value="&lt;symbol type=&quot;line&quot; clip_to_extent=&quot;1&quot; frame_rate=&quot;10&quot; force_rhr=&quot;0&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot;&gt;&lt;data_defined_properties&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/&gt;&lt;Option name=&quot;properties&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/&gt;&lt;/Option&gt;&lt;/data_defined_properties&gt;&lt;layer pass=&quot;0&quot; id=&quot;{54214e10-726d-429b-b154-c956f4c1eb1d}&quot; enabled=&quot;1&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/&gt;&lt;/Option&gt;&lt;data_defined_properties&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/&gt;&lt;Option name=&quot;properties&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/&gt;&lt;/Option&gt;&lt;/data_defined_properties&gt;&lt;/layer&gt;&lt;/symbol&gt;" name="lineSymbol"/>
              <Option type="double" value="0" name="minLength"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
              <Option type="QString" value="MM" name="minLengthUnit"/>
              <Option type="double" value="0" name="offsetFromAnchor"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
              <Option type="double" value="0" name="offsetFromLabel"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule key="{41a211df-e5f8-4ad0-91b2-bb477ebe477b}" description="2d_loc QA summary">
        <settings calloutType="simple">
          <text-style fontWeight="75" tabStopDistanceUnit="Point" useSubstitutions="0" textColor="20,20,20,255,rgb:0.0784313725,0.0784313725,0.0784313725,1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" fontSize="8" fontKerning="1" blendMode="0" fontStrikeout="0" forcedBold="0" allowHtml="0" namedStyle="Bold" isExpression="1" fontLetterSpacing="0" multilineHeight="1.15" textOpacity="1" fontUnderline="0" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontItalic="0" forcedItalic="0" capitalization="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" textOrientation="horizontal" fontSizeUnit="Point" multilineHeightUnit="Percentage" fieldName="with_variable(&#10;  'g', geometry($currentfeature),&#10;  with_variable(&#10;    'r', exterior_ring(@g),&#10;    with_variable(&#10;      'p1', point_n(@r, 1),&#10;      with_variable(&#10;        'p2', point_n(@r, 2),&#10;        with_variable(&#10;          'p3', point_n(@r, 3),&#10;          with_variable(&#10;            'p4', point_n(@r, 4),&#10;            with_variable(&#10;  'l12', distance(@p1, @p2),&#10;  with_variable(&#10;    'l14', distance(@p1, @p4),&#10;    with_variable(&#10;      'dot',&#10;      (x(@p2)-x(@p1))*(x(@p4)-x(@p1)) +&#10;      (y(@p2)-y(@p1))*(y(@p4)-y(@p1)),&#10;      with_variable(&#10;        'p3_expected',&#10;        make_point(x(@p2)+x(@p4)-x(@p1), y(@p2)+y(@p4)-y(@p1)),&#10;        with_variable(&#10;          'rectangle_ok',&#10;          coalesce(&#10; num_points(@r)=5 AND num_rings(@g)=1&#10;            AND @l12&gt;0 AND @l14&gt;0&#10;            AND abs(@dot) &lt;= 0.001*@l12*@l14&#10;            AND distance(@p3,@p3_expected) &lt;= 0.001,&#10;            false&#10;          ),&#10;          with_variable(&#10;            'axis_aligned',&#10;            coalesce(&#10; num_points(@r)=5&#10;              AND (x(@p1)=x(@p2) OR y(@p1)=y(@p2))&#10;              AND (x(@p2)=x(@p3) OR y(@p2)=y(@p3))&#10;              AND (x(@p3)=x(@p4) OR y(@p3)=y(@p4))&#10;              AND (x(@p4)=x(@p1) OR y(@p4)=y(@p1)),&#10;              false&#10;            ),&#10;            with_variable(&#10;              'clockwise_ok',&#10;              coalesce(&#10; num_points(@r)=5 AND (&#10;                  x(@p1)*y(@p2)-y(@p1)*x(@p2)&#10;                  +x(@p2)*y(@p3)-y(@p2)*x(@p3)&#10;                  +x(@p3)*y(@p4)-y(@p3)*x(@p4)&#10;                  +x(@p4)*y(@p1)-y(@p4)*x(@p1)&#10;                ) &lt; 0,&#10;                false&#10;              ),&#10;              with_variable(&#10;                'lower_left_ok',&#10;                coalesce(&#10; num_points(@r)=5&#10;                  AND x(@p1)&lt;=x(@p2) AND x(@p1)&lt;=x(@p3) AND x(@p1)&lt;=x(@p4)&#10;                  AND y(@p1)&lt;=y(@p2) AND y(@p1)&lt;=y(@p3) AND y(@p1)&lt;=y(@p4),&#10;                  false&#10;                ),&#10;                '2d_loc QA' || '\n' ||&#10;                'CRS alignment: ' || if(@axis_aligned, 'ALIGNED', 'ROTATED') || '\n' ||&#10;                'Internal rectangle: ' || if(@rectangle_ok, 'PASS', 'FAIL') || '\n' ||&#10;                'Clockwise order: ' || if(@clockwise_ok, 'PASS', 'FAIL') || '\n' ||&#10;                'V1 lower-left (CRS): ' ||&#10;                  if(@axis_aligned, if(@lower_left_ok, 'PASS', 'FAIL'), 'N/A — rotated') || '\n' ||&#10;                'Overall: ' ||&#10;                  if(@rectangle_ok AND @clockwise_ok AND (NOT @axis_aligned OR @lower_left_ok), 'PASS', 'FAIL')&#10;              )&#10;            )&#10;          )&#10;        )&#10;      )&#10;    )&#10;  )&#10;)&#10;          )&#10;        )&#10;      )&#10;    )&#10;  )&#10;)" fontFamily="Arial" fontWordSpacing="0" tabStopDistance="80">
            <families/>
            <text-buffer bufferDraw="1" bufferSizeUnits="MM" bufferBlendMode="0" bufferSize="1.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="0" bufferOpacity="0.92" bufferJoinStyle="128" bufferColor="255,255,255,255,rgb:1,1,1,1"/>
            <text-mask maskSize="1.5" maskSize2="1.5" maskSizeUnits="MM" maskedSymbolLayers="" maskJoinStyle="128" maskEnabled="0" maskOpacity="1" maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeBorderWidthUnit="Point" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="Point" shapeSizeY="0" shapeOffsetY="0" shapeRadiiX="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeJoinStyle="64" shapeRotation="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeOpacity="1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="Point" shapeSizeType="0" shapeRotationType="0" shapeSVGFile="" shapeBlendMode="0" shapeOffsetX="0" shapeRadiiY="0" shapeType="0" shapeOffsetUnit="Point" shapeBorderColor="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" shapeSizeX="0" shapeDraw="0">
              <symbol type="marker" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="markerSymbol" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" id="" enabled="1" class="SimpleMarker" locked="0">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="232,113,141,255,rgb:0.90980392156862744,0.44313725490196076,0.55294117647058827,1" name="color"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="circle" name="name"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="35,35,35,255,rgb:0.13725490196078433,0.13725490196078433,0.13725490196078433,1" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="MM" name="outline_width_unit"/>
                    <Option type="QString" value="diameter" name="scale_method"/>
                    <Option type="QString" value="2" name="size"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                    <Option type="QString" value="MM" name="size_unit"/>
                    <Option type="QString" value="1" name="vertical_anchor_point"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol type="fill" clip_to_extent="1" frame_rate="10" force_rhr="0" is_animated="0" name="fillSymbol" alpha="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" id="" enabled="1" class="SimpleFill" locked="0">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="128,128,128,255,rgb:0.50196078431372548,0.50196078431372548,0.50196078431372548,1" name="outline_color"/>
                    <Option type="QString" value="no" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="Point" name="outline_width_unit"/>
                    <Option type="QString" value="solid" name="style"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowRadiusUnit="MM" shadowBlendMode="6" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetDist="1" shadowScale="100" shadowUnder="0" shadowRadius="1.5"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format autoWrapLength="0" useMaxLineLengthForAutoWrap="1" wrapChar="" decimals="3" plussign="0" leftDirectionSymbol="&lt;" multilineAlign="3" formatNumbers="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" addDirectionSymbol="0" rightDirectionSymbol="&gt;"/>
          <placement overlapHandling="AllowOverlapAtNoCost" rotationUnit="AngleDegrees" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" overrunDistance="0" overrunDistanceUnit="MM" preserveRotation="1" prioritization="PreferCloser" maxCurvedCharAngleIn="25" geometryGeneratorEnabled="1" xOffset="0" dist="0" lineAnchorTextPoint="FollowPlacement" rotationAngle="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" lineAnchorPercent="0.5" quadOffset="4" layerType="PolygonGeometry" distUnits="MM" centroidWhole="0" lineAnchorClipping="0" maximumDistanceUnit="MM" repeatDistanceUnits="MM" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" allowDegraded="0" lineAnchorType="0" offsetUnits="MM" yOffset="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" polygonPlacementFlags="2" fitInPolygonOnly="0" maximumDistance="0" geometryGenerator="centroid(geometry($currentfeature))" placementFlags="10" distMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" geometryGeneratorType="PointGeometry" maxCurvedCharAngleOut="-25" offsetType="0" centroidInside="0" priority="5"/>
          <rendering fontMinPixelSize="3" scaleMax="0" drawLabels="1" obstacleType="1" scaleVisibility="0" upsidedownLabels="0" labelPerPart="0" scaleMin="0" obstacleFactor="1" unplacedVisibility="1" fontMaxPixelSize="10000" maxNumLabels="2000" limitNumLabels="0" minFeatureSize="0" zIndex="8" fontLimitPixelSize="0" obstacle="0" mergeLines="0"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
              <Option type="int" value="0" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
              <Option type="bool" value="false" name="drawToAllParts"/>
              <Option type="QString" value="0" name="enabled"/>
              <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
              <Option type="QString" value="&lt;symbol type=&quot;line&quot; clip_to_extent=&quot;1&quot; frame_rate=&quot;10&quot; force_rhr=&quot;0&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot;&gt;&lt;data_defined_properties&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/&gt;&lt;Option name=&quot;properties&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/&gt;&lt;/Option&gt;&lt;/data_defined_properties&gt;&lt;layer pass=&quot;0&quot; id=&quot;{54214e10-726d-429b-b154-c956f4c1eb1d}&quot; enabled=&quot;1&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.23529411764705882,0.23529411764705882,0.23529411764705882,1&quot; name=&quot;line_color&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/&gt;&lt;/Option&gt;&lt;data_defined_properties&gt;&lt;Option type=&quot;Map&quot;&gt;&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/&gt;&lt;Option name=&quot;properties&quot;/&gt;&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/&gt;&lt;/Option&gt;&lt;/data_defined_properties&gt;&lt;/layer&gt;&lt;/symbol&gt;" name="lineSymbol"/>
              <Option type="double" value="0" name="minLength"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
              <Option type="QString" value="MM" name="minLengthUnit"/>
              <Option type="double" value="0" name="offsetFromAnchor"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
              <Option type="double" value="0" name="offsetFromLabel"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
    </rules>
  </labeling>
</qgis>
