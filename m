Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C43F61561F
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Nov 2022 00:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiKAXaH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Nov 2022 19:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiKAXaG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Nov 2022 19:30:06 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094211A807;
        Tue,  1 Nov 2022 16:30:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 763D3CE1EEC;
        Tue,  1 Nov 2022 23:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5B8C433C1;
        Tue,  1 Nov 2022 23:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667345401;
        bh=0DH3p60Q9Sit9vQShKZA2cBhAhz9RfMBp8p21uqdgz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KyZdUSyHT6bFnOPj4/XcwYG2ARzeGix+3LQcQjjRzIaFGWACveqhcsQzZUWI+gSLO
         lUXRnQM5le7ha9tNuQnLuYVqWh11jutBB2kn++l/h/mdd6i1WS3sx2n04ZnwJ5b77/
         306QavC+MYuPGjEAtIHJ1zNXHiGZhBQCJbxgRr2zA/Dd5pfGIFwaIMmyTOULlNmvZY
         pbmYSOpHUUFCWTNLhMaEJXufBEtwbdyyPuRsSqg6edaGzfVpctnp1+NlgmLx4DJh8W
         UUroMW+/ftahskSge+wviVjLyaCaAetNhtZ3lOlj+lFrj1gUcIdLNTxnfpOKYfSC3f
         3m119lUTnZtLA==
Received: by pali.im (Postfix)
        id B785A7F8; Wed,  2 Nov 2022 00:29:58 +0100 (CET)
Date:   Wed, 2 Nov 2022 00:29:58 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: tegra: Update comment about config space
Message-ID: <20221101232958.5fxghwlligw26h65@pali>
References: <20220911113216.14892-1-pali@kernel.org>
 <YzRcYwQYlawV10QS@orome>
 <20221005194336.gdnu4vfzkudedjw5@pali>
 <Yz7PEakeTyvmnxDh@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yz7PEakeTyvmnxDh@orome>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thursday 06 October 2022 14:50:25 Thierry Reding wrote:
> On Wed, Oct 05, 2022 at 09:43:36PM +0200, Pali Rohár wrote:
> > On Wednesday 28 September 2022 16:38:27 Thierry Reding wrote:
> > > On Sun, Sep 11, 2022 at 01:32:16PM +0200, Pali Rohár wrote:
> > > > Like many other ARM PCIe controllers, it uses old PCI Configuration
> > > > Mechanism #1 from PCI Local Bus for accessing PCI config space.
> > > > It is not PCIe ECAM in any case.
> > > > 
> > > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > > > ---
> > > >  drivers/pci/controller/pci-tegra.c | 8 +++++---
> > > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > Perhaps this should be rolled into the PCI_CONF1_EXT_ADDRESS patch?
> > 
> > Well, I split documentation change and PCI_CONF1_EXT_ADDRESS usage into
> > two patches as those are two different / separate things. Documentation
> > change is a fix (because documentation is wrong) and PCI_CONF1_EXT_ADDRESS
> > is an improvement - code cleanup. And in case if there is a issue with
> > "cleanup" patch it can be reverted without need to revert also "fix"
> > part. This is just information how I looked at these changes and why I
> > decided to split them.
> > 
> > > On
> > > the other hand there's really no use in keeping this comment around
> > > after that other patch because the documentation for the new macro lays
> > > out the details already.
> > > 
> > > Thierry
> > 
> > Ok, whether documentation is needed or not - it is your maintainer
> > decision. Maybe really obvious things do not have to be documented.
> > Also another look at this problem can be that if somebody wrote wrong
> > documentation for it, maybe it is not too obvious? I do not have opinion
> > on this, so choose what is better :-)
> 
> I wrote that documentation back at the time and I fail to see what
> exactly is wrong about it. Granted, it doesn't mention the Intel PCI
> Configuration mechanism #1 from the PCI Local Bus Specification, but
> that's just because I didn't know about it. Back when I wrote this I
> was looking at the PCIe specifications (because, well, this supports
> PCIe) and I noticed that it was similar to ECAM. And that's exactly
> what the comment says and it points out what the differences are.
> 
> So just because the mapping is closer to PCI_CONF1_EXT_ADDRESS than
> ECAM, it doesn't automatically make the comment wrong. The mapping also
> isn't exactly PCI_CONF1_EXT_ADDRESS, so the new comment can be
> considered equally wrong. The mapping is neither ECAM nor PCI_CONF1, so
> describing it one way or the other doesn't make a difference.

PCI_CONF1_EXT_ADDRESS express indirect register access. If you look at
the address space of Intel PCI Configuration Mechanism #1 then it is
really what this ARM PCIe controller implements (plus uses additional
bits for larger 4kB space). This is really common what lot of non-ECAM
ARM SoC implements. It is really bad to mix this mapping with ECAM.
