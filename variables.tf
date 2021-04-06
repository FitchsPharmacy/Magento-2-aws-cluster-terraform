variable "ec2" {
  description  = "EC2 instances names and types included in AutoScaling groups"
  default      = {
    varnish    = "m6g.large"
    frontend   = "c6g.xlarge"
    admin      = "c6g.xlarge"
    staging    = "c6g.xlarge"
   }
}

variable "ec2_extra" {
  description  = "EC2 instance name and type for build and developer systems"
  default      = {
    build      = "t4g.micro"
    developer  = "c6g.xlarge"
   }
}

variable "magento" {
  description      = "Map some magento values"
  default          = {
    mage_owner            = "fitchs"
    mage_domain           = "aws.fitchs.com.au"
    mage_admin_email      = "scott.wakefield@fitchs.com.au"
    mage_staging_domain   = "staging.aws.fitchs.com.au"
    mage_developer_domain = "developer.aws.fitchs.com.au"
    admin_path            = "ADMIN_PLACEHOLDER"
    language              = "en_AU"
    currency              = "AUD"
    timezone              = "UTC"
    php_version           = "7.4"
  }
}

variable "elk" {
  description      = "Map some ElasticSearch configuration values"
  default  = {
    elk_domain      = "fitchs-elk"
    elk_ver         = "7.9"
    elk_type        = "t2.small.elasticsearch"
    elk_ebs_enabled = true
    elk_ebs_type    = "gp2"
    elk_ebs         = "10"
  }
}

variable "rds" {
  description      = "Map some RDS configuration values"
  default  = {
    rds_database     = "fitchs_aws"
    rds_storage      = "20"
    rds_max_storage  = "100"
    rds_storage_type = "gp2"
    rds_version      = "8.0.21"
    rds_class        = "db.m6g.large"
    rds_engine       = "mysql"
    rds_params       = "default.mysql8.0"
    rds_skip_snap    = "true"
  }
}
	  
variable "redis" {
  description      = "Map some ElastiCache configuration values"
  default  = {    
    redis_type       = "cache.m6g.large"
    redis_params     = "default.redis6.x.cluster.on"
    redis_replica    = "2"
    redis_shard      = "1"
    redis_name       = ["session", "cache"]
  }
}
	  
variable "asg" {
  description      = "Map some Autoscaling configuration values"
  default  = {
    asg_des         = "1"
    asg_min         = "1"
    asg_max         = "5"
  }
}
	  
variable "asp" {
  description      = "Map some Autoscaling Policy configuration values"
  default  = {	  
    asp_eval_periods  = "2"
    asp_period        = "300"
    asp_out_threshold = "60"
    asp_in_threshold  = "25"
  }
}

variable "s3" {
  description = "S3 names"
  type        = set(string)
  default     = ["media", "static", "system"]
}

variable "efs_name" {
  description = "EFS names"
  type        = set(string)
  default     = ["developer", "staging"]
}

variable "load_balancer_name" {
  description = "Load balanser names"
  type        = set(string)
  default     = ["outer", "inner"]
}

variable "ec2_instance_profile_policy" {
  description = "Policy attach to ec2 instance profile"
  type        = set(string)
  default     = [
  "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess", 
  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy", 
  "arn:aws:iam::aws:policy/AmazonS3FullAccess", 
  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}

variable "eventsbridge_policy" {
  description = "Policy attach to EventsBridge role"
  type        = set(string)
  default     = [
  "arn:aws:iam::aws:policy/service-role/CloudWatchEventsBuiltInTargetExecutionAccess", 
  "arn:aws:iam::aws:policy/service-role/CloudWatchEventsInvocationAccess",
  "arn:aws:iam::aws:policy/service-role/AmazonSSMAutomationRole"
  ]
}
