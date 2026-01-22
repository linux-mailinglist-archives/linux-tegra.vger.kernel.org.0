Return-Path: <linux-tegra+bounces-11480-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOvnLu5tcmlpkwAAu9opvQ
	(envelope-from <linux-tegra+bounces-11480-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 19:35:26 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4356C837
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 19:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B39E1300CA17
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 18:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D0C35D613;
	Thu, 22 Jan 2026 18:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4MgO7ir"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3829354ACA;
	Thu, 22 Jan 2026 18:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769105236; cv=none; b=qkLkRSqsgsMQkNY42fBuK0TiMUXRUkarpTuCYZHgAKQXLOpdz3LM2ngj5woXxt5TsHIa+HzFBPd3/k2QEfXnmS3SlDa91QN6PmF/e49ZYGNv1QC6xnHZkJ+jcGu8K4tmq1+YpC94ZaKlDm0XOYWwYMHS6ixsLei5OCD4oSHWwYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769105236; c=relaxed/simple;
	bh=wN9ZCmjUsgfm4qkKjFTDF64YeJA5BNp7YAJTNuGgBb4=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rffCI6mdaC7/02/RMrC6i0kWO/YgclN1uuIewbI+sxIKyIHPi0qmZ5f5q+DgjhJ6XxdceJLnJYnlc0XU3xG8oYpJLNfhaEprlBgoS7zH8Z4jOobFLwZ3yhqYN0q72XEOL7dUolyPL0pjnMoMaRU63GSdw6QATwBHkzacUSeZHiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4MgO7ir; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341C7C116D0;
	Thu, 22 Jan 2026 18:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769105235;
	bh=wN9ZCmjUsgfm4qkKjFTDF64YeJA5BNp7YAJTNuGgBb4=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=c4MgO7irYFYpWutLr0jQKY0uG14Vqd4Y/5+kkzg9eaGXtd56moCVDxGqPKiepWBth
	 QKKK5QmGYbs7p1OgqhKnF1tCMz8p9C3Y9m/jDkESZoIh+8C5H1KXSA4tOK7dYDPpwO
	 +eNOn+ODS83WwbgX+ofyDqd35rV7WfjoddjsUz0hJa/6YHobjeC1/fm1xWJSDBt8LS
	 /tN278Ak1fBKL8azaz3kyPlindBX+8nxnipLvX0aw4YASoMIoyjl4lSE2FE/gsZe7K
	 KFJIXjZp7X+DfcW3A0f5H3fyk3U0Vbo0XRh0bJ75o1nyA15lU6Nwx99NfFJ0PlyW6K
	 L/nW7xTaA2aTQ==
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Jan 2026 12:07:14 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 David Hildenbrand <david@redhat.com>, 
 "T . J . Mercier" <tjmercier@google.com>, David Airlie <airlied@gmail.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linaro-mm-sig@lists.linaro.org, 
 Sumit Garg <sumit.garg@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-tegra@vger.kernel.org, linux-mm@kvack.org, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 John Stultz <jstultz@google.com>
To: Thierry Reding <thierry.reding@kernel.org>
In-Reply-To: <20260122161009.3865888-1-thierry.reding@kernel.org>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
Message-Id: <176910484137.3006995.3850336645613910946.robh@kernel.org>
Subject: Re: [PATCH v2 00/10] dma-bug: heaps: Add Tegra VPR support
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,ffwll.ch,linux-foundation.org,lists.freedesktop.org,vger.kernel.org,redhat.com,google.com,gmail.com,arm.com,lists.linaro.org,linaro.org,kvack.org,collabora.com];
	TAGGED_FROM(0.00)[bounces-11480-lists,linux-tegra=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[1.3.102.64:email,0.53.182.0:email,0.234.17.224:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[6a00000:email,1c:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,devicetree.org:url,31c0000:email,nvidia.com:email,0.103.194.128:email,31e0000:email,0.105.73.32:email,0.236.52.192:email]
X-Rspamd-Queue-Id: 2C4356C837
X-Rspamd-Action: no action


On Thu, 22 Jan 2026 17:09:59 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> This series adds support for the video protection region (VPR) used on
> Tegra SoC devices. It's a special region of memory that is protected
> from accesses by the CPU and used to store DRM protected content (both
> decrypted stream data as well as decoded video frames).
> 
> Patches 1 and 2 add DT binding documentation for the VPR and add the VPR
> to the list of memory-region items for display and host1x.
> 
> Patch 3 adds bitmap_allocate(), which is like bitmap_allocate_region()
> but works on sizes that are not a power of two.
> 
> Patch 4 introduces new APIs needed by the Tegra VPR implementation that
> allow CMA areas to be dynamically created at runtime rather than using
> the fixed, system-wide list. This is used in this driver specifically
> because it can use an arbitrary number of these areas (though they are
> currently limited to 4).
> 
> Patch 5 adds some infrastructure for DMA heap implementations to provide
> information through debugfs.
> 
> The Tegra VPR implementation is added in patch 6. See its commit message
> for more details about the specifics of this implementation.
> 
> Finally, patches 7-10 add the VPR placeholder node on Tegra234 and hook
> it up to the host1x and GPU nodes so that they can make use of this
> region.
> 
> Changes in v2:
> - Tegra VPR implementation is now more optimized to reduce the number of
>   (very slow) resize operations, and allows cross-chunk allocations
> - dynamic CMA areas are now trackd separately from static ones, but the
>   global number of CMA pages accounts for all areas
> 
> Thierry
> 
> Thierry Reding (10):
>   dt-bindings: reserved-memory: Document Tegra VPR
>   dt-bindings: display: tegra: Document memory regions
>   bitmap: Add bitmap_allocate() function
>   mm/cma: Allow dynamically creating CMA areas
>   dma-buf: heaps: Add debugfs support
>   dma-buf: heaps: Add support for Tegra VPR
>   arm64: tegra: Add VPR placeholder node on Tegra234
>   arm64: tegra: Add GPU node on Tegra234
>   arm64: tegra: Hook up VPR to host1x
>   arm64: tegra: Hook up VPR to the GPU
> 
>  .../display/tegra/nvidia,tegra186-dc.yaml     |   10 +
>  .../display/tegra/nvidia,tegra20-dc.yaml      |   10 +-
>  .../display/tegra/nvidia,tegra20-host1x.yaml  |    7 +
>  .../nvidia,tegra-video-protection-region.yaml |   55 +
>  arch/arm/mm/dma-mapping.c                     |    2 +-
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      |   60 +
>  arch/s390/mm/init.c                           |    2 +-
>  drivers/dma-buf/dma-heap.c                    |   56 +
>  drivers/dma-buf/heaps/Kconfig                 |    7 +
>  drivers/dma-buf/heaps/Makefile                |    1 +
>  drivers/dma-buf/heaps/cma_heap.c              |    2 +-
>  drivers/dma-buf/heaps/tegra-vpr.c             | 1265 +++++++++++++++++
>  include/linux/bitmap.h                        |   25 +-
>  include/linux/cma.h                           |    7 +-
>  include/linux/dma-heap.h                      |    2 +
>  include/trace/events/tegra_vpr.h              |   57 +
>  mm/cma.c                                      |  187 ++-
>  mm/cma.h                                      |    5 +-
>  18 files changed, 1713 insertions(+), 47 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
>  create mode 100644 drivers/dma-buf/heaps/tegra-vpr.c
>  create mode 100644 include/trace/events/tegra_vpr.h
> 
> --
> 2.52.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20260121 (exact match)
 Base: tags/next-20260121 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20260122161009.3865888-1-thierry.reding@kernel.org:

arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 263, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 263, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 263, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 263, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 248, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 248, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 248, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 248, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /bus@0/i2c@31e0000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: /bus@0/i2c@31c0000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): phy-mode: ['10gbase-r'] does not contain items matching the given schema
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: /bus@0/i2c@31e0000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): phy-mode: ['10gbase-r'] does not contain items matching the given schema
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']






