Return-Path: <linux-tegra+bounces-310-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76556813975
	for <lists+linux-tegra@lfdr.de>; Thu, 14 Dec 2023 19:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0731F282E0F
	for <lists+linux-tegra@lfdr.de>; Thu, 14 Dec 2023 18:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE07567E86;
	Thu, 14 Dec 2023 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWQXK28E"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E67123;
	Thu, 14 Dec 2023 10:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702577381; x=1734113381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kQsTyReN6U5/B4j4CeAMns8RYLO2IGmgecq4Y3yTN6Q=;
  b=eWQXK28E7cw+A0LqiVZ+2g607VPCrwTR8H7aAh+U3tu7+TpQ9SNOITtn
   4qFX6axLpY11OeYjjYoOs9zhi3N2VlWDsQkM2O7Kg01tRIvRUu5NonR8q
   iRgoY0dazhEHCXL5QLeimy8QmkBH9/UwjOtLZtSpnCM4SHmutivymVibn
   Z+58/rJEo7qqhswecRcAo5v8KsXa8mdphVHgzwOMBhbcrMvUxrzBnLrtW
   MvIYZsBieCAvVZRpZZU0gkcqFbMreXRSPTxsW2M01Af0K2seoYwaOJdKV
   ZfDWFBmg5sdaFHDFTWRzcLo4SMSuJ/f5SXoDfahict2Q7EmKWwQX7XL9i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="13852775"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="13852775"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 10:09:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="897825349"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="897825349"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Dec 2023 10:09:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDq9A-000MSI-11;
	Thu, 14 Dec 2023 18:09:27 +0000
Date: Fri, 15 Dec 2023 02:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil R <akhilrajeev@nvidia.com>, herbert@gondor.apana.org.au,
	davem@davemloft.net, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
	jonathanh@nvidia.com, linux-tegra@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Akhil R <akhilrajeev@nvidia.com>
Subject: Re: [PATCH 3/5] crypto: tegra: Add Tegra Security Engine driver
Message-ID: <202312150118.ydw2nowl-lkp@intel.com>
References: <20231213122030.11734-4-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213122030.11734-4-akhilrajeev@nvidia.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on drm/drm-next arm64/for-next/core robh/for-next linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-crypto-Add-Tegra-SE-DT-binding-doc/20231213-202407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20231213122030.11734-4-akhilrajeev%40nvidia.com
patch subject: [PATCH 3/5] crypto: tegra: Add Tegra Security Engine driver
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20231215/202312150118.ydw2nowl-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150118.ydw2nowl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150118.ydw2nowl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/tegra/tegra-se-hash.c:22:
   drivers/crypto/tegra/tegra-se-hash.c: In function 'tegra_sha_get_config':
   drivers/crypto/tegra/tegra-se.h:55:57: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      55 | #define SE_SHA_CFG_ENC_ALG(x)                           FIELD_PREP(GENMASK(15, 12), x)
         |                                                         ^~~~~~~~~~
   drivers/crypto/tegra/tegra-se.h:59:57: note: in expansion of macro 'SE_SHA_CFG_ENC_ALG'
      59 | #define SE_SHA_ENC_ALG_SHA                              SE_SHA_CFG_ENC_ALG(3)
         |                                                         ^~~~~~~~~~~~~~~~~~
   drivers/crypto/tegra/tegra-se-hash.c:53:24: note: in expansion of macro 'SE_SHA_ENC_ALG_SHA'
      53 |                 cfg |= SE_SHA_ENC_ALG_SHA;
         |                        ^~~~~~~~~~~~~~~~~~
   drivers/crypto/tegra/tegra-se-hash.c: In function 'tegra_sha_init':
>> drivers/crypto/tegra/tegra-se-hash.c:457:21: warning: variable 'algname' set but not used [-Wunused-but-set-variable]
     457 |         const char *algname;
         |                     ^~~~~~~
   cc1: some warnings being treated as errors


vim +/algname +457 drivers/crypto/tegra/tegra-se-hash.c

   450	
   451	static int tegra_sha_init(struct ahash_request *req)
   452	{
   453		struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
   454		struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
   455		struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
   456		struct tegra_se *se = ctx->se;
 > 457		const char *algname;
   458	
   459		if (ctx->fallback)
   460			return tegra_sha_fallback_init(req);
   461	
   462		algname = crypto_tfm_alg_name(&tfm->base);
   463	
   464		rctx->total_len = 0;
   465		rctx->datbuf.size = 0;
   466		rctx->residue.size = 0;
   467		rctx->key_id = ctx->key_id;
   468		rctx->task = SHA_FIRST;
   469		rctx->alg = ctx->alg;
   470		rctx->blk_size = crypto_ahash_blocksize(tfm);
   471		rctx->digest.size = crypto_ahash_digestsize(tfm);
   472	
   473		rctx->digest.buf = dma_alloc_coherent(se->dev, rctx->digest.size,
   474						      &rctx->digest.addr, GFP_KERNEL);
   475		if (!rctx->digest.buf)
   476			goto digbuf_fail;
   477	
   478		rctx->residue.buf = dma_alloc_coherent(se->dev, rctx->blk_size,
   479						       &rctx->residue.addr, GFP_KERNEL);
   480		if (!rctx->residue.buf)
   481			goto resbuf_fail;
   482	
   483		rctx->datbuf.buf = dma_alloc_coherent(se->dev, SE_SHA_BUFLEN,
   484						      &rctx->datbuf.addr, GFP_KERNEL);
   485		if (!rctx->datbuf.buf)
   486			goto datbuf_fail;
   487	
   488		return 0;
   489	
   490	datbuf_fail:
   491		dma_free_coherent(se->dev, rctx->blk_size, rctx->residue.buf,
   492				  rctx->residue.addr);
   493	resbuf_fail:
   494		dma_free_coherent(se->dev, SE_SHA_BUFLEN, rctx->datbuf.buf,
   495				  rctx->datbuf.addr);
   496	digbuf_fail:
   497		return -ENOMEM;
   498	}
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

