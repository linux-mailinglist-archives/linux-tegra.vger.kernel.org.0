Return-Path: <linux-tegra+bounces-11750-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOEcD9QrfWmPQgIAu9opvQ
	(envelope-from <linux-tegra+bounces-11750-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Jan 2026 23:08:20 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC974BF060
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Jan 2026 23:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 255D1301413F
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Jan 2026 22:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381B537AA64;
	Fri, 30 Jan 2026 22:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dn+GXskS"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB202D23B6;
	Fri, 30 Jan 2026 22:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769810895; cv=none; b=BCSCsNPUTdEr2phwu7aWvQ7mPo1+F71dS4hYMg9mhv8Qarw76ksgHO0epuFZA6Usn7UqaMmC4jL6EmERvjudZRbvYGi0K1QmLBJ36oyiVSMqMIrQf7Ht3xXp+vyiD7wdy1JlmphMHCm90LPnkmVUIT3QYBuV5gJmnGcCSohIJW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769810895; c=relaxed/simple;
	bh=4AxjIqvscBzxsPsSN0HE0NqBZ+G8oQmEn6yJ9jl163E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBTumVkMKA9gBbR5TQnoQI4l56yhK151RZjGSRS6NTCl1wN8wX+TizBquBuZJdFP1FuENuI14p156pxnQnE0LZ+TIk6g1f5SdCyzfR6dQl3juv4OtbhfM1tJFs7Z0N+3zYOGGZBaOFdoY8OtVDPVvtLUCiry/1m0nae5MtCzOwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dn+GXskS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769810894; x=1801346894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4AxjIqvscBzxsPsSN0HE0NqBZ+G8oQmEn6yJ9jl163E=;
  b=Dn+GXskShl+pNaUmIP1CCo1IAIeZOKPOVvVKBxouq1XARJx5zHRsbVj3
   l1hZTUeo5+PrrbTW/CVfHRBhCdXXvVhh+l3OoycmAdfFlwBJ7bzevXkVH
   GCJPYdsxA5q3rG+1nP7+S71aQJyxoLvOvNwRPdKAJptZ+hjXuyqIRYP0n
   WX/Lng11QutdFI/myI5nFd5UsYxq7Q5OUL3K0StOyars46t5dQoyHBivo
   dspx3tXbp+ongNMKIXTzxe+PJ5EqLM5JPkCRtIBWhUM5a5pkqmKp4gY6K
   9LSdvSTpfUHcv7B+2yE9prPnvRqiEj2LZLN0pxfcjtkb45HIpBK/J99VJ
   A==;
X-CSE-ConnectionGUID: R+3Lk1Z7RDyvZbjWFEkJ5g==
X-CSE-MsgGUID: axNXcljlQ0C3LchaQfLsBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="74689499"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="74689499"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 14:08:13 -0800
X-CSE-ConnectionGUID: N1bBLNjxSlmdLIJDxekE7g==
X-CSE-MsgGUID: hFXevYttQs2UXVQMAHhw6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="213896405"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Jan 2026 14:08:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlwet-000000002Yr-0iE8;
	Fri, 30 Jan 2026 22:08:07 +0000
Date: Fri, 30 Jan 2026 23:07:49 +0100
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] ASoC: tegra: Support CPCAP by machine driver
Message-ID: <202601302320.3lveRyEF-lkp@intel.com>
References: <20260130133434.353353-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130133434.353353-3-clamor95@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pgazz.com,gmail.com,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-11750-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,nvidia.com,perex.cz,suse.com,yahoo.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: CC974BF060
X-Rspamd-Action: no action

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on broonie-sound/for-next robh/for-next linus/master v6.19-rc7 next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/ASoC-dt-bindings-nvidia-tegra-audio-document-CPCAP-CODEC/20260130-214002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20260130133434.353353-3-clamor95%40gmail.com
patch subject: [PATCH v1 2/4] ASoC: tegra: Support CPCAP by machine driver
config: arm-kismet-CONFIG_SND_SOC_CPCAP-CONFIG_SND_SOC_TEGRA_CPCAP-0-0 (https://download.01.org/0day-ci/archive/20260130/202601302320.3lveRyEF-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260130/202601302320.3lveRyEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601302320.3lveRyEF-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_CPCAP when selected by SND_SOC_TEGRA_CPCAP
   WARNING: unmet direct dependencies detected for SND_SOC_CPCAP
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && (MFD_CPCAP [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - SND_SOC_TEGRA_CPCAP [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_TEGRA [=y] && I2C [=y] && GPIOLIB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

