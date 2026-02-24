Return-Path: <linux-tegra+bounces-12159-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHBZLB6bnWnwQgQAu9opvQ
	(envelope-from <linux-tegra+bounces-12159-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Feb 2026 13:35:42 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18626187064
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Feb 2026 13:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E4BA310B43A
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Feb 2026 12:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504473815E3;
	Tue, 24 Feb 2026 12:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q8sabCLe"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD57225791;
	Tue, 24 Feb 2026 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936346; cv=none; b=Qi/Q+m2gizpqrQarRK+66I2K8hHRXKO7BVQgvM0IJcw/LW3sjXk/rpifcH/ptOre12K4APmq88yQ4NLC7XoegBBbzG25DcK8cnfouNMUZeb7DO03+T24UgSWyihZrZ3ifnB0SYAIMYkr3CDLmyP9iDE+AyHJPVX+6WRjCk5VWp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936346; c=relaxed/simple;
	bh=0+tv1fGyJ3vKJDUwYgmcVIbgQI2yBZ21qKKCF7hk3tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGXja55kPLoB7fLxO8iaOwVjnCLppV2BCX4JOzXd1nlVcZmKYu5TvEL3LsXrKIq0hL9x8P/oDqwHwWj9owLmhXA85Z0LX2F+nf8/dB7JSqtLmOTfbcqKxiMmkUZnHdzbEjUbQ//FXG9/nZSNL/X5zr//ZTRf7Mb1EG8w38jkEJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q8sabCLe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB4EC116D0;
	Tue, 24 Feb 2026 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771936345;
	bh=0+tv1fGyJ3vKJDUwYgmcVIbgQI2yBZ21qKKCF7hk3tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8sabCLeN3RQP50LrUxVvoRQ419ZlmhvBKe3rb2cVvRV9zYN6MjfUkrgWxXAgW32w
	 JUdik2kbnh97vtouJVQ2CMWcng75erc8Ef9zQmCKPkmT4KBSy4RA4ZfaMacdGtYIPf
	 NdO4vi5wZGo+Oeoj09w1ZLTduvhETIgUbDdZ/gHPW+8I6q9sQ21VChq/9RC4Bx9opj
	 lttYP2YJ6929m8SfG47wb6Z0bccV6xehtZ80J+3sDJpzmPTLFeDzaHMcRn3Rtght0X
	 6ZPudHlq3ZoVjI6JIu9SOJviUor+FzDFavWePJBJXslxia5tuLFd9GHF2NETSTVPY6
	 5Q1JhBLnJtJnA==
Date: Tue, 24 Feb 2026 14:32:21 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: robin.murphy@arm.com, joro@8bytes.org, will@kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH RFC] iommu/dma: Validate page before accessing P2PDMA
 state
Message-ID: <20260224123221.GM10607@unreal>
References: <20260224104257.1641429-1-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224104257.1641429-1-amhetre@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12159-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 18626187064
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 10:42:57AM +0000, Ashish Mhetre wrote:
> When mapping scatter-gather entries that reference reserved
> memory regions without struct page backing (e.g., bootloader created
> carveouts), is_pci_p2pdma_page() dereferences the page pointer
> returned by sg_page() without first verifying its validity.

I believe this behavior started after commit 88df6ab2f34b  
("mm: add folio_is_pci_p2pdma()"). Prior to that change, the
is_zone_device_page(page) check would return false when given a
non‑existent page pointer.

If any fix is needed, the is_pci_p2pdma_page() must be changed and not iommu.

Thanks

> 
> This causes a kernel paging fault when CONFIG_PCI_P2PDMA is enabled
> and dma_map_sg_attrs() is called for memory regions that have no
> associated struct page:
> 
> Unable to handle kernel paging request at virtual address fffffc007d100000
>   ...
>   Call trace:
>    iommu_dma_map_sg+0x118/0x414
>    dma_map_sg_attrs+0x38/0x44
> 
> Fix this by adding a pfn_valid() check before calling
> is_pci_p2pdma_page(). If the page frame number is invalid, skip the
> P2PDMA check entirely as such memory cannot be P2PDMA memory anyway.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/iommu/dma-iommu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 5dac64be61bb..5f45f33b23c2 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1423,6 +1423,9 @@ int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
>  		size_t s_length = s->length;
>  		size_t pad_len = (mask - iova_len + 1) & mask;
>  
> +		if (!pfn_valid(page_to_pfn(sg_page(s))))
> +			goto post_pci_p2pdma;
> +
>  		switch (pci_p2pdma_state(&p2pdma_state, dev, sg_page(s))) {
>  		case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
>  			/*
> @@ -1449,6 +1452,7 @@ int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
>  			goto out_restore_sg;
>  		}
>  
> +post_pci_p2pdma:
>  		sg_dma_address(s) = s_iova_off;
>  		sg_dma_len(s) = s_length;
>  		s->offset -= s_iova_off;
> -- 
> 2.25.1
> 
> 

