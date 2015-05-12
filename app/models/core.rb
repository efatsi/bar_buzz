class Core < ActiveRecord::Base
  has_many :means
  has_many :variances

  def fetch_data
    means     << Mean.new(value: spark_core.variable("mean"))
    variances << Variance.new(value: spark_core.variable("variance"))
  end

  def spark_core
    @spark_core ||= RubySpark::Core.new(spark_id)
  end
end
