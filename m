Return-Path: <linux-tegra+bounces-14252-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHNPGPV3+2lnbgMAu9opvQ
	(envelope-from <linux-tegra+bounces-14252-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 06 May 2026 19:18:45 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E194DEBE9
	for <lists+linux-tegra@lfdr.de>; Wed, 06 May 2026 19:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBFFB3008768
	for <lists+linux-tegra@lfdr.de>; Wed,  6 May 2026 17:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44A548BD42;
	Wed,  6 May 2026 17:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoWPL3Ns"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA723D332C;
	Wed,  6 May 2026 17:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087914; cv=none; b=Ucu4vQb2VuXPLWepMDTUnafuzzr8aS3trTwEGyRLctrCLa6TEPYi9sq5wZeJyu2ahOYWr//Du+tIAum+Aara5MaigeujKvE4ePk92E/d24cjWivMTs5K8CGXcmxlwbDWU5eKKDSAX1DeHyz+MHNeTt4lYDYWpgWjVDt+i2rkFAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087914; c=relaxed/simple;
	bh=MKhUYQpBlny7azoXrW/1cc8EFMweik0RsJgT4PfJcCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jF72sWbDp96VzcQo2yRXvIL1lPYJGiMHEf0ogY4vLHgayKv3Tovi8J9bL4IOiKO1Bv4zYJRytv15KXt2r/eYFLD3wQRkLJgWJm3ZsOmrUVyDgYFaniVWIBRFWGdIBXfFUfUoZ01oEyaDu/NhoHBnHuIHxd+OrYqhVM1uk3xGVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoWPL3Ns; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6572CC2BCB0;
	Wed,  6 May 2026 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778087913;
	bh=MKhUYQpBlny7azoXrW/1cc8EFMweik0RsJgT4PfJcCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoWPL3Nsa592G0H63aOsgPrEkmTLcpRkbrfNV7OC4DWMxTKy2IDG2Qc17AfORMvq4
	 FbSVF/sPo06kkMotuJ/o4sVm7svEICB+ZJbSFwR6lwTlowN93OBCs/pr1Vuw7/qm7q
	 EZvNp3ac49h9cx2x9zr4JzPLDETsuiLwSZtAM5KkQ877nuZBKP2nvaV7JjtmckTntZ
	 oHJep68hzu31R7L13ClBJStJLWg872OkCWuUXX4pRddpPgOMnD+r0Ebo0EoqYF9dMt
	 /nZs2bvQc9aoToDq2ANXwUMwNTaeAzoA8yQCRjq9kmqmEPug/eMI3m3GLFFfxjTdEn
	 l534aEB+eQdoQ==
Date: Wed, 6 May 2026 22:48:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, mark.rutland@arm.com, lpieralisi@kernel.org, 
	bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
Message-ID: <4ympdtnpqrydnjmapuswsnig7ymuopy4kpxqclyxnoaqgpdmxl@eywcfbu3avtg>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acrdFfk8al80dynq@baldur>
 <ces6pczk5yo2v5h6sga2dl2xuncqv4pmudunc7dhyeiy6swfh7@bk7vxdxrsrzz>
 <adO1lS2g8Hewj0Ol@baldur>
 <a6lce6bq3yjzidxzq6w2xuiyevvgfuu5crbijtzeiukecmwvhh@k2w64iyj7q7q>
 <cbffc0ec-2961-4a3f-91e8-770f3f7f8bcc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbffc0ec-2961-4a3f-91e8-770f3f7f8bcc@nvidia.com>
X-Rspamd-Queue-Id: A5E194DEBE9
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-14252-lists,linux-tegra=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, May 05, 2026 at 02:47:08PM +0100, Jon Hunter wrote:
> Hi Mani,
> 
> On 06/04/2026 15:29, Manivannan Sadhasivam wrote:
> 
> ...
> 
> > Sure. It makes logical sense to relate this API behavior with the state of CX.
> > I'll send v2 with the updated commit message.
> 
> Did you ever send a V2? I am not sure if I missed it and so wanted to check.
> 

No, I didn't. I had some offline discussions with Bjorn and concluded that it
might not be appropriate to set pm_set_resume/suspend_via_firmware() for all
firmware flavors that our Qcom SoCs support.

Then I found out a limitation with our Root Complex IPs in exiting L1ss if the
platform is suspended. So sent out a series to fix that and that allowed me to
get past the NVMe issue coincidentally.

But since this patch applies to other ARM64 SoCs, it logically makes sense to
apply it IMO. So, I'll leave it to PSCI maintainers to decide.

- Mani

[1] https://lore.kernel.org/linux-pci/20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com

-- 
மணிவண்ணன் சதாசிவம்

