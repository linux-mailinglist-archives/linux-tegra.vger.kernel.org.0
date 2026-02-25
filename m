Return-Path: <linux-tegra+bounces-12172-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FLSD3SsnmntWgQAu9opvQ
	(envelope-from <linux-tegra+bounces-12172-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Feb 2026 09:01:56 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAA7193E08
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Feb 2026 09:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCAB031333A6
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Feb 2026 07:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A6930EF90;
	Wed, 25 Feb 2026 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfqiLdX+"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215B930E852;
	Wed, 25 Feb 2026 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772006173; cv=none; b=T+j0dXQ2mDM00tNpHWFWQWYMEGWyQJWVlXT3oidHbMpdJXMXjUSmonWfXm/NY6u0PfNZmL2xcB4eJWM+JE0cQfoivm1l8t0pxH/cBDszc/JbQO6PK8O27rIlbqE/40gtSciOm+hWdP7NXqJ5Wok+XYMO/bBZ391r8wjEul/YcTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772006173; c=relaxed/simple;
	bh=JqFR4U/I4MB+SKLFl9OdO6R2LAzf+H3aHpw6oWSGOSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToIkXnv2Wp6Hveg29+xiW1yv2xO0JAHvdpYGph+0rxMgGkxP57lbcVDKkTeYSBXQeQREhBZXRBs8H7puksBxa6EpjeLlxdVyGsc4jXjPMf3odW26O7vahGmAipqunDoQqIjvSqEuf0gYIKyD0DpRG9jnBQJLJYmqmxAWmBH/4mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfqiLdX+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F4DC4AF09;
	Wed, 25 Feb 2026 07:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772006172;
	bh=JqFR4U/I4MB+SKLFl9OdO6R2LAzf+H3aHpw6oWSGOSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfqiLdX+BCpABsbWe3Of/Ix1OstPBdj3NaP2fSQoptwGjcCv92DCb4bZNJpkWAbrB
	 GdByBXHvlt3lsF9GnscNYZmYGViRi1UTL+6MJaoTUsTeJxpK8yhXYZda4si1PIf01f
	 +gq6VibJdxGU0azGnJCqmiVSPtMEsb5IvgV8MU4zat+Ee+UiSb+CbRHa2UdsUlJBPG
	 pe5CLE1sb1k0PpDsH54Y+4AIOLN9cPnBlI//Q8vkZ+PTvIulR7AERM4leQLrQG3D7r
	 gfJQXnBOK/9bVEuzILpbV4uyPiS9uue5gLCuKIJmJAdJs0tx0mBcWDe/J/wqh9moMy
	 zIQ3VRCVdJqww==
Date: Wed, 25 Feb 2026 09:56:09 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>, robin.murphy@arm.com,
	joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH RFC] iommu/dma: Validate page before accessing P2PDMA
 state
Message-ID: <20260225075609.GB9541@unreal>
References: <20260224104257.1641429-1-amhetre@nvidia.com>
 <20260224123221.GM10607@unreal>
 <aZ4Q1HA9q1ojsVYY@google.com>
 <9d01b4e3-be5b-4c9c-8088-1d10f67f1fd8@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d01b4e3-be5b-4c9c-8088-1d10f67f1fd8@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12172-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABAA7193E08
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 10:19:41AM +0530, Ashish Mhetre wrote:
> 
> 
> On 2/25/2026 2:27 AM, Pranjal Shrivastava wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Tue, Feb 24, 2026 at 02:32:21PM +0200, Leon Romanovsky wrote:
> > > On Tue, Feb 24, 2026 at 10:42:57AM +0000, Ashish Mhetre wrote:
> > > > When mapping scatter-gather entries that reference reserved
> > > > memory regions without struct page backing (e.g., bootloader created
> > > > carveouts), is_pci_p2pdma_page() dereferences the page pointer
> > > > returned by sg_page() without first verifying its validity.
> > > I believe this behavior started after commit 88df6ab2f34b
> > > ("mm: add folio_is_pci_p2pdma()"). Prior to that change, the
> > > is_zone_device_page(page) check would return false when given a
> > > non‑existent page pointer.
> > > 
> 
> Thanks Leon for the review. This crash started after commit 30280eee2db1
> ("iommu/dma: support PCI P2PDMA pages in dma-iommu map_sg").
> 
> > Doesn't folio_is_pci_p2pdma() also check for zone device?
> > I see[1] that it does:
> > 
> > static inline bool folio_is_pci_p2pdma(const struct folio *folio)
> > {
> >          return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> >                  folio_is_zone_device(folio) &&
> >                  folio->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
> > }
> > 
> > I believe the problem arises due to the page_folio() call in
> > folio_is_pci_p2pdma(page_folio(page)); within is_pci_p2pdma_page().
> > page_folio() assumes it has a valid struct page to work with. For these
> > carveouts, that isn't true.
> > 
> > Potentially something like the following would stop the crash:
> > 
> > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > index e3c2ccf872a8..e47876021afa 100644
> > --- a/include/linux/memremap.h
> > +++ b/include/linux/memremap.h
> > @@ -197,7 +197,8 @@ static inline void folio_set_zone_device_data(struct folio *folio, void *data)
> > 
> >   static inline bool is_pci_p2pdma_page(const struct page *page)
> >   {
> > -       return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> > +       return IS_ENABLED(CONFIG_PCI_P2PDMA) && page &&
> > +               pfn_valid(page_to_pfn(page)) &&
> >                  folio_is_pci_p2pdma(page_folio(page));
> >   }
> > 
> 
> Yes, this will also fix the crash.
> 
> > But my broader question is: why are we calling a page-based API like
> > is_pci_p2pdma_page() on non-struct-page memory in the first place?
> > Could we instead add a helper to verify if the sg_page() return value
> > is actually backed by a struct page? If it isn't, we should arguably
> > skip the P2PDMA logic entirely and fall back to a dma_map_phys style
> > path. Isn't handling these "pageless" physical ranges the primary reason
> > dma_map_phys exists?
> 
> Thanks for the feedback, Pranjal.
> 
> To clarify: are you suggesting we handle non-page-backed mappings inside
> iommu_dma_map_sg (within dma-iommu), or that callers should detect
> non-page-backed memory and use dma_map_phys instead of dma_map_sg?

The latter one.

> Former approach sounds better so that existing iommu_dma_map_sg callers
> don't need changes, but I'd like to confirm your preference.

The bug is in callers which used wrong API, they need to be adapted.

Thanks

