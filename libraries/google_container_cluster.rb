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
require 'google/container/property/cluster_addons_config'
require 'google/container/property/cluster_addons_config_gce_persistent_disk_csi_driver_config'
require 'google/container/property/cluster_addons_config_horizontal_pod_autoscaling'
require 'google/container/property/cluster_addons_config_http_load_balancing'
require 'google/container/property/cluster_addons_config_kubernetes_dashboard'
require 'google/container/property/cluster_addons_config_network_policy_config'
require 'google/container/property/cluster_binary_authorization'
require 'google/container/property/cluster_conditions'
require 'google/container/property/cluster_database_encryption'
require 'google/container/property/cluster_default_max_pods_constraint'
require 'google/container/property/cluster_ip_allocation_policy'
require 'google/container/property/cluster_legacy_abac'
require 'google/container/property/cluster_master_auth'
require 'google/container/property/cluster_master_auth_client_certificate_config'
require 'google/container/property/cluster_master_authorized_networks_config'
require 'google/container/property/cluster_master_authorized_networks_config_cidr_blocks'
require 'google/container/property/cluster_network_config'
require 'google/container/property/cluster_network_policy'
require 'google/container/property/cluster_node_config'
require 'google/container/property/cluster_node_config_accelerators'
require 'google/container/property/cluster_node_config_shielded_instance_config'
require 'google/container/property/cluster_node_config_taints'
require 'google/container/property/cluster_node_pools'
require 'google/container/property/cluster_private_cluster_config'
require 'google/container/property/cluster_release_channel'
require 'google/container/property/cluster_shielded_nodes'

# A provider to manage Google Kubernetes Engine resources.
class ContainerCluster < GcpResourceBase
  name 'google_container_cluster'
  desc 'Cluster'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :description
  attr_reader :initial_node_count
  attr_reader :node_config
  attr_reader :master_auth
  attr_reader :logging_service
  attr_reader :monitoring_service
  attr_reader :network
  attr_reader :database_encryption
  attr_reader :private_cluster_config
  attr_reader :cluster_ipv4_cidr
  attr_reader :enable_tpu
  attr_reader :tpu_ipv4_cidr_block
  attr_reader :addons_config
  attr_reader :subnetwork
  attr_reader :locations
  attr_reader :resource_labels
  attr_reader :label_fingerprint
  attr_reader :legacy_abac
  attr_reader :network_policy
  attr_reader :default_max_pods_constraint
  attr_reader :ip_allocation_policy
  attr_reader :endpoint
  attr_reader :initial_cluster_version
  attr_reader :current_master_version
  attr_reader :current_node_version
  attr_reader :create_time
  attr_reader :status
  attr_reader :status_message
  attr_reader :node_ipv4_cidr_size
  attr_reader :services_ipv4_cidr
  attr_reader :current_node_count
  attr_reader :expire_time
  attr_reader :conditions
  attr_reader :master_authorized_networks_config
  attr_reader :node_pools
  attr_reader :binary_authorization
  attr_reader :release_channel
  attr_reader :shielded_nodes
  attr_reader :network_config
  attr_reader :enable_kubernetes_alpha
  attr_reader :location

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @description = @fetched['description']
    @initial_node_count = @fetched['initialNodeCount']
    @node_config = GoogleInSpec::Container::Property::ClusterNodeConfig.new(@fetched['nodeConfig'], to_s)
    @master_auth = GoogleInSpec::Container::Property::ClusterMasterAuth.new(@fetched['masterAuth'], to_s)
    @logging_service = @fetched['loggingService']
    @monitoring_service = @fetched['monitoringService']
    @network = @fetched['network']
    @database_encryption = GoogleInSpec::Container::Property::ClusterDatabaseEncryption.new(@fetched['databaseEncryption'], to_s)
    @private_cluster_config = GoogleInSpec::Container::Property::ClusterPrivateClusterConfig.new(@fetched['privateClusterConfig'], to_s)
    @cluster_ipv4_cidr = @fetched['clusterIpv4Cidr']
    @enable_tpu = @fetched['enableTpu']
    @tpu_ipv4_cidr_block = @fetched['tpuIpv4CidrBlock']
    @addons_config = GoogleInSpec::Container::Property::ClusterAddonsConfig.new(@fetched['addonsConfig'], to_s)
    @subnetwork = @fetched['subnetwork']
    @locations = @fetched['locations']
    @resource_labels = @fetched['resourceLabels']
    @label_fingerprint = @fetched['labelFingerprint']
    @legacy_abac = GoogleInSpec::Container::Property::ClusterLegacyAbac.new(@fetched['legacyAbac'], to_s)
    @network_policy = GoogleInSpec::Container::Property::ClusterNetworkPolicy.new(@fetched['networkPolicy'], to_s)
    @default_max_pods_constraint = GoogleInSpec::Container::Property::ClusterDefaultMaxPodsConstraint.new(@fetched['defaultMaxPodsConstraint'], to_s)
    @ip_allocation_policy = GoogleInSpec::Container::Property::ClusterIpAllocationPolicy.new(@fetched['ipAllocationPolicy'], to_s)
    @endpoint = @fetched['endpoint']
    @initial_cluster_version = @fetched['initialClusterVersion']
    @current_master_version = @fetched['currentMasterVersion']
    @current_node_version = @fetched['currentNodeVersion']
    @create_time = parse_time_string(@fetched['createTime'])
    @status = @fetched['status']
    @status_message = @fetched['statusMessage']
    @node_ipv4_cidr_size = @fetched['nodeIpv4CidrSize']
    @services_ipv4_cidr = @fetched['servicesIpv4Cidr']
    @current_node_count = @fetched['currentNodeCount']
    @expire_time = parse_time_string(@fetched['expireTime'])
    @conditions = GoogleInSpec::Container::Property::ClusterConditionsArray.parse(@fetched['conditions'], to_s)
    @master_authorized_networks_config = GoogleInSpec::Container::Property::ClusterMasterAuthorizedNetworksConfig.new(@fetched['masterAuthorizedNetworksConfig'], to_s)
    @node_pools = GoogleInSpec::Container::Property::ClusterNodePoolsArray.parse(@fetched['nodePools'], to_s)
    @binary_authorization = GoogleInSpec::Container::Property::ClusterBinaryAuthorization.new(@fetched['binaryAuthorization'], to_s)
    @release_channel = GoogleInSpec::Container::Property::ClusterReleaseChannel.new(@fetched['releaseChannel'], to_s)
    @shielded_nodes = GoogleInSpec::Container::Property::ClusterShieldedNodes.new(@fetched['shieldedNodes'], to_s)
    @network_config = GoogleInSpec::Container::Property::ClusterNetworkConfig.new(@fetched['networkConfig'], to_s)
    @enable_kubernetes_alpha = @fetched['enableKubernetesAlpha']
    @location = @fetched['location']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Cluster #{@params[:name]}"
  end

  def has_logging_enabled?
    return false if !defined?(@logging_service)
    return false if @logging_service.nil?
    return true if /logging\.googleapis\.com/ =~ @logging_service
    false
  end

  def has_monitoring_enabled?
    return false if !defined?(@monitoring_service)
    return false if @monitoring_service.nil?
    return true if /monitoring\.googleapis\.com/ =~ @monitoring_service
    false
  end

  def has_legacy_abac_disabled?
    return nil if !defined?(@legacy_abac)
    return true if @legacy_abac.to_h.empty?
    false
  end

  def has_master_authorized_networks_enabled?
    return false if !defined?(@master_authorized_networks_config)
    return false if @master_authorized_networks_config.to_h.empty?
    return false if !defined?(@master_authorized_networks_config.enabled)
    return true if @master_authorized_networks_config.enabled == true
    false
  end

  def has_resource_labels?
    return false if !defined?(@resource_labels)
    return false if @resource_labels.to_h.empty?
    true
  end

  def has_basic_authorization?
    return false if @master_auth.username.nil? and @master_auth.password.nil?
    true
  end

  def has_network_policy_enabled?
    return false if !defined?(@network_policy.enabled)
    return true if  @network_policy.enabled==true
    false
  end

  def has_master_auth_client_key?
    return false if !defined?(@master_auth.client_key)
    return false if @master_auth.client_key.nil?
    return false if @master_auth.client_key==''
    true
  end

  def has_ip_alias_enabled?
    return false if !defined?(@ip_allocation_policy.use_ip_aliases)
    return true if @ip_allocation_policy.use_ip_aliases==true
    false
  end

  def has_pod_security_policy_config?
    return false if !defined?(@pod_security_policy_config.enabled)
    return true if @pod_security_policy_config.enabled==true
    false
  end

  def private_cluster?
    return false if !defined?(@private_cluster)
    return true if @private_cluster==true
    false
  end

  private

  def product_url(_ = nil)
    'https://container.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{location}}/clusters/{{name}}'
  end
end
