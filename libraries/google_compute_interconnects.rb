# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'gcp_backend'
class ComputeInterconnects < GcpResourceBase
  name 'google_compute_interconnects'
  desc 'Interconnect plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:admin_enableds, field: :admin_enabled)
  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:locations, field: :location)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:noc_contact_emails, field: :noc_contact_email)
  filter_table_config.add(:peer_ip_addresses, field: :peer_ip_address)
  filter_table_config.add(:google_ip_addresses, field: :google_ip_address)
  filter_table_config.add(:client_operation_ids, field: :client_operation_id)
  filter_table_config.add(:google_reference_ids, field: :google_reference_id)
  filter_table_config.add(:provisioned_link_counts, field: :provisioned_link_count)
  filter_table_config.add(:customer_names, field: :customer_name)
  filter_table_config.add(:requested_link_counts, field: :requested_link_count)
  filter_table_config.add(:operational_statuses, field: :operational_status)
  filter_table_config.add(:link_types, field: :link_type)
  filter_table_config.add(:interconnect_types, field: :interconnect_type)
  filter_table_config.add(:interconnect_attachments, field: :interconnect_attachments)
  filter_table_config.add(:expected_outages, field: :expected_outages)
  filter_table_config.add(:circuit_infos, field: :circuit_infos)
  filter_table_config.add(:satisfies_pzs, field: :satisfies_pzs)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('items')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, 'Get')
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      'adminEnabled' => ->(obj) { return :admin_enabled, obj['adminEnabled'] },
      'creationTimestamp' => ->(obj) { return :creation_timestamp, parse_time_string(obj['creationTimestamp']) },
      'description' => ->(obj) { return :description, obj['description'] },
      'location' => ->(obj) { return :location, obj['location'] },
      'id' => ->(obj) { return :id, obj['id'] },
      'name' => ->(obj) { return :name, obj['name'] },
      'nocContactEmail' => ->(obj) { return :noc_contact_email, obj['nocContactEmail'] },
      'peerIpAddress' => ->(obj) { return :peer_ip_address, obj['peerIpAddress'] },
      'googleIpAddress' => ->(obj) { return :google_ip_address, obj['googleIpAddress'] },
      'clientOperationId' => ->(obj) { return :client_operation_id, obj['clientOperationId'] },
      'googleReferenceId' => ->(obj) { return :google_reference_id, obj['googleReferenceId'] },
      'provisionedLinkCount' => ->(obj) { return :provisioned_link_count, obj['provisionedLinkCount'] },
      'customerName' => ->(obj) { return :customer_name, obj['customerName'] },
      'requestedLinkCount' => ->(obj) { return :requested_link_count, obj['requestedLinkCount'] },
      'operationalStatus' => ->(obj) { return :operational_status, obj['operationalStatus'] },
      'linkType' => ->(obj) { return :link_type, obj['linkType'] },
      'interconnectType' => ->(obj) { return :interconnect_type, obj['interconnectType'] },
      'interconnectAttachments' => ->(obj) { return :interconnect_attachments, obj['interconnectAttachments'] },
      'expectedOutages' => ->(obj) { return :expected_outages, GoogleInSpec::Compute::Property::InterconnectExpectedOutagesArray.parse(obj['expectedOutages'], to_s) },
      'circuitInfos' => ->(obj) { return :circuit_infos, GoogleInSpec::Compute::Property::InterconnectCircuitInfosArray.parse(obj['circuitInfos'], to_s) },
      'satisfiesPzs' => ->(obj) { return :satisfies_pzs, obj['satisfiesPzs'] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url(_ = nil)
    'https://compute.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/interconnects'
  end
end
