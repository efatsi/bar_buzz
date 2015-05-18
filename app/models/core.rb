class Core < ActiveRecord::Base
  has_many :means
  has_many :variances

  def connected?
    spark_core.info["connected"] == true
  rescue
    false
  end

  def fetch_data
    if Time.zone.now.hour > 7 && Time.zone.now.hour < 19
      mean     = Mean.new(value: spark_core.variable("mean"), day: Date.current)
      variance = Variance.new(value: spark_core.variable("variance"), day: Date.current)

      means     << mean
      variances << variance

      "#{mean.value} / #{variance.value}"
    end
  end

  # private

  def spark_core
    @spark_core ||= RubySpark::Core.new(spark_id)
  end
end
