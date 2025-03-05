Return-Path: <linux-tegra+bounces-5453-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E30A50635
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Mar 2025 18:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39EB816F98D
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Mar 2025 17:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BD518CBEC;
	Wed,  5 Mar 2025 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6bwMf49"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388BC567D;
	Wed,  5 Mar 2025 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741195045; cv=none; b=VmLlw1forfPuWfmRWD0E8Q2f6Wzsj6ItWtroi7qWsGrWxYzsBlnUh2c4yZqZNEPl3iJr9oU8xXGvBNj739kttU3uyk3JwsJdA4D+lovnPgdG+X6pkukJmGLbmW9Gi/+m+fd/AZVsgCgSJ62u+FeRsqerDqpp4ie3db5kYEVOAa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741195045; c=relaxed/simple;
	bh=rgaJ8Vl+DVZyMaAeb8l37NkQiLBSOoKduXMe+7d8pA8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sjODuCFgbCCxHbyUWL2LZ/QtJLiwsZTYzjNE8nUb1yTO6DuajmFXr+ze0RjNfpgKM3AuWomYp4XeOUyNs+pQI5C+jG4RVG/JIXLMfnbDKp7MnjsVPqkEdHQHj5ruybhG+J9Sz8dwnJUlsF9c2tx+YxRJZvJkyIjrXgWZFjhUu/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6bwMf49; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741195043; x=1772731043;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=rgaJ8Vl+DVZyMaAeb8l37NkQiLBSOoKduXMe+7d8pA8=;
  b=R6bwMf49MV/Tbvm5voY39fmTyABwvgNwX+CtDpBSoyyHrjFQgtq7H6Ib
   9KVV2rR3XziuUUpHvEBo3HaOVA0DN4JE+BKL3N/Kd356Gc4KV0KYHtVxQ
   tV7Ujvy1tSErh8JuCSkTR84+jUME22i21FWAI4tdOGI51Nc1/XvUaIfYK
   UF8LOD5hKiew7LKUECCDr7KJGwexuC3htpeawD+yV88sByx6pQR7sgtuS
   ud1dz2oLH5gT0Kj10/vH004JULjUMzLEz9iEAb1qx0UUUxlNFX0J4Wvbr
   +bubQoblckHvhX5EVQJ1L3b5ZbjMykauptQ3PBVIt0syC/GAW4I2fO582
   g==;
X-CSE-ConnectionGUID: bBpFmfLdQf6FQUAkLUThJQ==
X-CSE-MsgGUID: A/vvGbDFRZGerVt4IOTbqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59717255"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59717255"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 09:17:23 -0800
X-CSE-ConnectionGUID: AFdM3JGSScqtVQ+GbsGbVg==
X-CSE-MsgGUID: V0HpwSGmRH2oG5k/Wqy/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119672490"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.49])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 09:17:19 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, thierry.reding@gmail.com,
 mperttunen@nvidia.com, airlied@gmail.com, simona@ffwll.ch,
 jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Handle EDID allocation failures in
 tegra_output_connector_get_modes()
In-Reply-To: <20250305154038.2062-1-vulab@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250305154038.2062-1-vulab@iscas.ac.cn>
Date: Wed, 05 Mar 2025 19:17:15 +0200
Message-ID: <874j07xuqs.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 05 Mar 2025, Wentao Liang <vulab@iscas.ac.cn> wrote:
> The return values of `drm_edid_dup()` and `drm_edid_read_ddc()` must
> be checked in `tegra_output_connector_get_modes()` to prevent NULL
> pointer dereferences. If either function fails, the function should
> immediately return 0, indicating that no display modes can be retrieved.

No. It works as designed, and drm_edid_connector_update() and
cec_notifier_set_phys_addr() *must* be called with NULL drm_edid in case
of failure.

> A proper implementation can be found in `vidi_get_modes()`, where the
> return values are carefully validated, and the function returns 0 upon
> failure.

That case is slightly different, as it doesn't actually access the
display at that point, but it wouldn't be wrong to skip the early
!drm_edid check there too.

> Fixes: 98365ca74cbf ("drm/tegra: convert to struct drm_edid")

When you claim to fix a commit, it's encouraged to Cc: the author and
possibly reviewers of said commit.


BR,
Jani.


> Cc: stable@vger.kernel.org # 6.12+
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/tegra/output.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index 49e4f63a5550..360c4f83a4f8 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -39,6 +39,9 @@ int tegra_output_connector_get_modes(struct drm_connector *connector)
>  	else if (output->ddc)
>  		drm_edid = drm_edid_read_ddc(connector, output->ddc);
>  
> +	if (!drm_edid)
> +		return 0;
> +
>  	drm_edid_connector_update(connector, drm_edid);
>  	cec_notifier_set_phys_addr(output->cec,
>  				   connector->display_info.source_physical_address);

-- 
Jani Nikula, Intel

