<fieldset class="col-xs-12">
	<legend><h5>GRAU ESFÉRICO <span><a href="javascript:void(0);" data-toggle="modal" data-target="#modal-esferico">O QUE É</a></span></h5></legend>

	<ul class="accordion esferico">
		<li class="miopia">
			<div class="accordion--headline">
				<p>Miopia (Negativo -)</p>
			</div>
			<div class="accordion--content">
				<ul>
					<li class="acao-fechar primeiro"
						data-p-ametropia="plana" 
						data-p-grau="0.0"
						>Sem Grau (Plano / 0.00)
					</li>
					{for $foo=-0.25 to -16.25  step -0.25}
						<li 
							data-p-ametropia="miopia" 
							data-p-grau="{$foo|number_format:2:".":""}"
							class="acao-fechar"
						>
							{$foo|number_format:2:".":""} 
						</li>
					{/for}
					<a href="{url entity='over-range'}" class='nao-encontrei'><li
						data-p-ametropia="nf-nada"
						data-p-grau="n" 
						class="ultimo">Não encontrei meu grau</li></a>
				</ul>
			</div>
		</li>

		<li class="divide text-xs-center">
			<fieldset>
				<legend>
					<img 
						src="{$urls.img_url}/prescricao/ou-novo.svg" 
						alt="ou"
					>
				</legend>
			</fieldset>
		</li>

		<li class="hipermetropia">
			<div class="accordion--headline">
				<p>Hipermetropia (Positivo +)</p>
			</div>
			<div class="accordion--content">
				<ul>
					<li class="acao-fechar primeiro"
						data-p-ametropia="plana" 
						data-p-grau="0.00"
						>Sem Grau (Plano / 0.00)
					</li>
					{for $foo=0.25 to 9.25  step 0.25}
						<li 
							data-p-ametropia="hipermetropia" 
							data-p-grau="{$foo|number_format:2:".":""}"
							class="acao-fechar"
						>
							{$foo|number_format:2:".":""} 
						</li>
					{/for}
					<a href="{url entity='over-range'}" class='nao-encontrei'><li 
						data-p-ametropia="nf-nada"
						data-p-grau="n" 
						class="ultimo">Não encontrei meu grau</li></a>
				</ul>
			</div>
		</li>
	</ul>
</fieldset>


<fieldset class="col-xs-12">
	<legend><h5>GRAU CILÍNDRICO <span><a href="javascript:void(0);" data-toggle="modal" data-target="#modal-cilindrico">O QUE É</a></span></h5></legend>

	<ul class="accordion cilindrico">
		<li class="astigmatismo">
			<div class="accordion--headline">
				<p>Astigmatismo (Cilíndrico)</p>
			</div>
			<div class="accordion--content">
				<ul>
					<li class="acao-fechar primeiro"
						data-p-ametropia="plana-astig" 
						data-p-grau="0.00"
						>Sem Grau (Plano / 0.00)
					</li>
					{for $foo=-0.25 to -3.25  step -0.25}
						<li 
							data-p-ametropia="astigmatismo" 
							data-p-grau="{$foo|number_format:2:".":""}" 
							class="acao-fechar"
						>
							{$foo|number_format:2:".":""} 
						</li>
					{/for}
					<a href="{url entity='over-range'}" class='nao-encontrei'><li 
						data-p-ametropia="nf-nada"
						data-p-grau="n" 
						class="ultimo">Não encontrei meu grau</li></a>
				</ul>
				
			</div>
			<p class="legenda-astig">Não se preocupe, para o processo de orçamento, ainda não precisamos do valor do seu <b>eixo</b> de astigmatismo.</p>
		</li>
	</ul>
</fieldset>
