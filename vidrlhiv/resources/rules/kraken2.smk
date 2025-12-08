rule kraken2_classify:
    input:
        R1 = get_fastq1,
        R2 = get_fastq2
    output:
        kraken_output = "results/kraken2/{sample}.kraken",
        kreport_output = "results/kraken2/{sample}.report"
    params:
        db = config["kraken2_db"]
    resources:
        load=4
    conda:
        "envs/kraken2.yaml"
    shell:
        """
        kraken2 --db {params.db} \
                --paired \
                --output {output.kraken_output} \
                --report {output.kreport_output} \
                {input.R1} {input.R2}
        """