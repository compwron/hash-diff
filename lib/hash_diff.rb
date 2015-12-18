class Hash
  def diff(other)
    dup.
      delete_if do |k, v|
      compare_equal v, other[k]
    end.
    merge!(other.dup.delete_if { |k, v| has_key?(k) })
  end

  private
  def compare_equal(a, b)
    if a.kind_of? BigDecimal or b.kind_of? BigDecimal
      if a.nil? or b.nil?
        false
      else
        a.to_d == b.to_d
      end
    else
      a == b
    end
  end
end
