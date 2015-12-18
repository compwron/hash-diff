class Hash
  def diff(other)
    p "DIFF"
    dup.
      delete_if do |k, v|
      compare_equal v, other[k]
    end.
    merge!(other.dup.delete_if { |k, v| has_key?(k) })
  end

  private
  def compare_equal(a, b)
    p 1
    if a.kind_of? BigDecimal or b.kind_of? BigDecimal
      p 2
      if a.nil? or b.nil?
        p 3
        false
      else
        p 4
        a.to_d == b.to_d
      end
    else
      p 5
      a == b
    end
    # false
  end
end
