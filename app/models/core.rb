class Core < ActiveRecord::Base
  has_many :means
  has_many :variances

  def connected?
    spark_core.info["connected"] == true
  rescue
    false
  end

  def fetch_data
    mean = Mean.new(value: spark_core.variable("mean"))
    variance = Variance.new(value: spark_core.variable("variance"))

    means     << mean
    variances << variance

    "#{mean.value} / #{variance.value}"
  end

  # private

  def spark_core
    @spark_core ||= RubySpark::Core.new(spark_id)
  end
end
