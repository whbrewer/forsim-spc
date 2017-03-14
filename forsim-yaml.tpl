%include('header')
<script src="/static/apps/forsim/forsim.js"></script>

<body>
%include('navbar')
%include('apps/alert')
<div class="container-fluid">
<form name="input_form" class="form-horizontal" action="/confirm" method="post" novalidate>
<input type="hidden" name="app" value="{{app}}">
%if defined('cid'):
<input type="hidden" name="cid" value="{{cid}}">
%end

<a href="/static/apps/forsim/RunningForSimManual_Aug2013.pdf" class="help btn btn-info" target="_blank"><span class="glyphicon glyphicon-question-sign"></span></a>

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
		<a href="#global" aria-controls="home" role="tab" data-toggle="tab">global</a>
	</li>
	<li role="presentation">
		<a href="#chromosome" aria-controls="home" role="tab" data-toggle="tab">chromosome</a>
	</li>
	<li role="presentation">
		<a href="#phenotype" aria-controls="home" role="tab" data-toggle="tab">phenotype</a>
	</li>
	<li role="presentation">
		<a href="#population" aria-controls="home" role="tab" data-toggle="tab">population</a>
	</li>
	<li role="script">
		<a href="#script" aria-controls="home" role="tab" data-toggle="tab">script</a>
	</li>
</ul>
<div class="tab-content">
<div role="tabpanel" class="tab-pane fade in active" id="global">

	<div class="form-group">
		<label for="generations" class="control-label col-xs-6">
			generations:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="generations"
			       value="{{generations}}" onchange="updateScript()"/>
		</div>
	</div>

	<div class="form-group">
		<label for="set_fertility_poisson" class="control-label col-xs-6">
			set_fertility_poisson:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="set_fertility_poisson" value="{{set_fertility_poisson}}" onchange="updateScript()"/>
		</div>
	</div>

	<div class="form-group">
		<label for="set_max_offspring_number" class="control-label col-xs-6">
			set_max_offspring_number:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="set_max_offspring_number" value="{{set_max_offspring_number}}"  onchange="updateScript()"/>
		</div>
	</div>

	<div class="form-group">
		<label for="prevalence_relative" class="control-label col-xs-6">
			prevalence_relative:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="prevalence_relative" value="{{prevalence_relative}}" onchange="updateScript()"/>
		</div>
	</div>

	<div class="form-group">
		<label for="mutation_rate_male" class="control-label col-xs-6">
			mutation_rate_male:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="text" class="form-control" name="mutation_rate_male" value="{{mutation_rate_male}}" onblur="correctSciNotation(this); updateScript()" />
		</div>
	</div>

	<div class="form-group">
		<label for="mutation_rate_female" class="control-label col-xs-6">
			mutation_rate_female:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="text" class="form-control" name="mutation_rate_female" value="{{mutation_rate_female}}" onblur="correctSciNotation(this); updateScript()"/>
		</div>
	</div>

	<div class="form-group">
		<label for="output" class="control-label col-xs-6">
			output:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="output"
			       value="{{output}}"  onchange="updateScript()"/>
		</div>
	</div>

	<div class="form-group">
		<label for="megabases_per_centimorgan_male" class="control-label col-xs-6">
			megabases_per_centimorgan_male:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="megabases_per_centimorgan_male"
			       value="{{megabases_per_centimorgan_male}}"  onchange="updateScript()"/>
		</div>
	</div>

	<div class="form-group">
		<label for="megabases_per_centimorgan_female" class="control-label col-xs-6">
			megabases_per_centimorgan_female:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="megabases_per_centimorgan_female" value="{{megabases_per_centimorgan_female}}" onchange="updateScript()"/>
		</div>
	</div>

	<div class="form-group">
		<label for="mating_with_replacement" class="control-label col-xs-6">
			mating_with_replacement:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="checkbox" name="mating_with_replacement" value="true"  onclick="updateScript()"
				%if mating_with_replacement== '':
					checked
				%end
			/>
		</div>
	</div>

	<div class="form-group">
		<label for="final_pedigree_depth" class="control-label col-xs-6">
			final_pedigree_depth:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="number" class="form-control" name="final_pedigree_depth" value="{{final_pedigree_depth}}" onchange="updateScript()"/>
		</div>
	</div>

	<div class="form-group">
		<label for="using_track_snps" class="control-label col-xs-6">
			using_track_snps:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="checkbox" name="using_track_snps" value="true"
			       onclick="updateScript()"
				%if using_track_snps== '':
					checked
				%end
			/>
		</div>
	</div>

	<div class="form-group">
		<label for="output_xml" class="control-label col-xs-6">
			output_xml:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="checkbox" name="output_xml" value="true" onclick="updateScript()"
				%if output_xml== '':
					checked
				%end
			/>
		</div>
	</div>

	<div class="form-group">
		<label for="output_svg" class="control-label col-xs-6">
			output_svg:</label>
		<div class="col-xs-12 col-sm-6">
			<input type="checkbox" name="output_svg" value="true" onclick="updateScript()"
				%if output_svg== '':
					checked
				%end
			/>
		</div>
	</div>

</div>

<div role="tabpanel" class="tab-pane fade in inactive" id="chromosome">

	<a class="btn btn-default" onclick="addChromosome()">Add Chromosome</a><br />

	<label class="control-label" style="width:150px; text-align:center; margin:5px">name</label>
	<label class="control-label" style="width:150px; text-align:center; margin:5px">location</label>
	<label class="control-label" style="width:150px; text-align:center; margin:5px">gamma</label>
	<label class="control-label" style="width:150px; text-align:center; margin:5px">probabilityNoEffect</label>
	<label class="control-label" style="width:150px; text-align:center; margin:5px">probabilityPositiveEffect</label>
</div>

<div role="tabpanel" class="tab-pane fade in inactive" id="phenotype">

	<a class="btn btn-default" onclick="addPhenotype()">Add Phenotype</a><br />
	<label class="control-label" style="width:150px; text-align:center; margin:5px">name</label>
	<label class="control-label" style="width:150px; text-align:center; margin:5px">definition</label>

</div>

<div role="tabpanel" class="tab-pane fade in inactive" id="population">

	<a class="btn btn-default" onclick="addPopulation()">Add Population</a><br />

	<label class="control-label" style="width:150px; text-align:center; margin:5px">name</label>
	<label class="control-label" style="width:150px; text-align:center; margin:5px">birth</label>
	<label class="control-label" style="width:150px; text-align:center; margin:5px">initial_size</label>
	<label class="control-label" style="width:150px; text-align:center; margin:5px">carrying_capacity</label>
	<label class="control-label" style="width:150px; text-align:center; margin:5px">growth_rate</label>
	<label class="control-label" style="width:150px; text-align:center; margin:5px">death</label>

</div>

<div role="tabpanel" class="tab-pane fade in inactive" id="script">

<a class="btn btn-default" onclick="updateScript()">Generate Script</a>

<textarea id="input_script" style="font-family:monospace" class="form-control" name="script" rows="20"></textarea>

</div>

</div>
</form>

<script>
$(document).ready(function() {
  addChromosome()
  addGene(chrom1)
  addPhenotype()
  addPopulation()
  updateScript()
})
</script>

%include('footer')
