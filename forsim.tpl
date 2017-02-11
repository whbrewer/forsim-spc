%include('header',title='confirm')
<head>
<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1'>
</head>
<body>
%include('navbar')
%include('apps/alert')
<div class="container-fluid">
<form class="form-horizontal" action="/confirm" method="post" novalidate>
<input type="hidden" name="app" value="{{app}}">
%if defined('cid'):
<input type="hidden" name="cid" value="{{cid}}">
%end
<div class="col-xs-12" style="height:5px"></div>
<div class="col-xs-12 visible-xs" style="height:5px"></div>
<div class="form-group">
	<div class="col-xs-2">
		<button type="submit" class="btn btn-success"> <!-- pull-right -->
		Continue <em class="glyphicon glyphicon-forward"></em> </button>
	</div>
	<label for="desc" style="text-align:right" class="control-label col-sm-4 hidden-xs">
		<a href="#" data-toggle="tooltip" title="Separate labels by commas">Labels:</a></label>
	<div class="hidden-xs col-sm-6">
		<input type="text" id="desc" name="desc" class="form-control" style="width:100%"
			data-role="tagsinput" title="e.g. v2.5.1,bottleneck">
	</div>
</div>
<div class="col-xs-12" style="height:5px"></div>
<ul class="nav nav-pills" role="tablist">
	<li role="presentation" class="active">
		<a href="#basic" aria-controls="home" role="tab" data-toggle="tab">basic</a>
	</li>
	<li role="presentation">
		<a href="#population" aria-controls="home" role="tab" data-toggle="tab">population</a>
	</li>
</ul>
<div class="tab-content">
<div role="tabpanel" class="tab-pane fade in active" id="basic">
	<div class="form-group">
		<label for="set_fertility_poisson" class="control-label col-xs-6">
			set_fertility_poisson:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="set_fertility_poisson" value="{{set_fertility_poisson}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="set_max_offspring_number" class="control-label col-xs-6">
			set_max_offspring_number:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="set_max_offspring_number" value="{{set_max_offspring_number}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="prevalence_relative" class="control-label col-xs-6">
			prevalence_relative:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="prevalence_relative" value="{{prevalence_relative}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="generations" class="control-label col-xs-6">
			generations:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="generations" value="{{generations}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="mutation_rate_male" class="control-label col-xs-6">
			mutation_rate_male:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="mutation_rate_male" value="{{mutation_rate_male}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="mutation_rate_female" class="control-label col-xs-6">
			mutation_rate_female:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="mutation_rate_female" value="{{mutation_rate_female}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="output" class="control-label col-xs-6">
			output:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="output" value="{{output}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="megabases_per_centimorgan_male" class="control-label col-xs-6">
			megabases_per_centimorgan_male:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="megabases_per_centimorgan_male" value="{{megabases_per_centimorgan_male}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="megabases_per_centimorgan_female" class="control-label col-xs-6">
			megabases_per_centimorgan_female:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="megabases_per_centimorgan_female" value="{{megabases_per_centimorgan_female}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="mating_with_replacement" class="control-label col-xs-6">
			mating_with_replacement:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="checkbox" name="mating_with_replacement" value="true"
%if mating_with_replacement== 'true':
checked
%end
		/>
		</div>
	</div>
	<div class="form-group">
		<label for="final_pedigree_depth" class="control-label col-xs-6">
			final_pedigree_depth:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="final_pedigree_depth" value="{{final_pedigree_depth}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="using_track_snps" class="control-label col-xs-6">
			using_track_snps:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="checkbox" name="using_track_snps" value="true"
%if using_track_snps== 'true':
checked
%end
		/>
		</div>
	</div>
	<div class="form-group">
		<label for="output_xml" class="control-label col-xs-6">
			output_xml:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="checkbox" name="output_xml" value="true"
%if output_xml== 'true':
checked
%end
		/>
		</div>
	</div>
	<div class="form-group">
		<label for="output_svg" class="control-label col-xs-6">
			output_svg:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="checkbox" name="output_svg" value="true"
%if output_svg== 'true':
checked
%end
		/>
		</div>
	</div>
</div>

<div role="tabpanel" class="tab-pane fade in inactive" id="population">
	<div class="form-group">
		<label for="name" class="control-label col-xs-6">
			name:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="text" class="form-control" name="name" value="{{name}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="birth" class="control-label col-xs-6">
			birth:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="birth" value="{{birth}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="initial_size" class="control-label col-xs-6">
			initial_size:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="initial_size" value="{{initial_size}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="carrying_capacity" class="control-label col-xs-6">
			carrying_capacity:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="carrying_capacity" value="{{carrying_capacity}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="growth_rate" class="control-label col-xs-6">
			growth_rate:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="growth_rate" value="{{growth_rate}}"/>
		</div>
	</div>
	<div class="form-group">
		<label for="death" class="control-label col-xs-6">
			death:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="death" value="{{death}}"/>
		</div>
	</div>
</div>

</div>
</form>
%include('footer')
