#need to be confirm how to run scrubby
rule Scrubby:
    input:
        R1 = get_fastq1,
        R2 = get_fastq2,
        #scrubby_index = rules.Scrubby_download.output.db
        #kraken_report = "results/kraken2/{sample}.report",
        #kraken_reads = "results/kraken2/{sample}.kraken"
    output:
        R1 = "results/scrubby/{sample}_R1.hiv.fastq.gz",
        R2 = "result/scrubby/{sample}_R2.hiv.fastq.gz",
        #read_report = "results/scrubby/{sample}.report.tsv",
        scrub_summary = "results/scrubby/{sample}.summary.json",
    params:
        taxa = "Orthoretrovirinae",
    threads:
        8
    conda:
        "envs/scrubby.yaml"
    resources:
        load=4
    shell:
        """
            scrubby reads \
                --extract \
                --classifier kraken2 \
                --index download/k2 \
                --input {input.R1} {input.R2} \
                --output {output.R1} {output.R2} \
                --threads {threads}
                --taxa {params.taxa} \
                --json {output.scrub_summary}
        """