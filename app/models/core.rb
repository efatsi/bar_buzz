class Core < ActiveRecord::Base
  has_many :means
  has_many :variances

  def connected?
    spark_core.info["connected"] == true
  rescue
    false
  end

  def fetch_data
    means     << Mean.new(value: spark_core.variable("mean"))
    variances << Variance.new(value: spark_core.variable("variance"))
  end

  # private

  def spark_core
    @spark_core ||= RubySpark::Core.new(spark_id)
  end
end
