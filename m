Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D6B67716B
	for <lists+linux-tegra@lfdr.de>; Sun, 22 Jan 2023 19:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjAVSSZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 22 Jan 2023 13:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbjAVSSY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Jan 2023 13:18:24 -0500
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2EB1C339;
        Sun, 22 Jan 2023 10:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1674411484; bh=AIXV2TGiESj5KnqGDnrHuajR2ctma0xQaktjNurltXg=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
        b=SuTD2tBjoLvTDF31EOzbsh0GYW2Vc5cT3F7g1x03ewBho4Ju8CAXdWWyeneFs5Ftk
         /cRnvXjCAowMJRvKpMdy4Edz/GZC+gVR4H0u2xeR5rldPP4Q7FOPKzX4JUQRiDxf+P
         HAcOWlqpjwHFFJXFJrb8VtM3S9TvdXjltd/ieSb4=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sun, 22 Jan 2023 19:18:04 +0100 (CET)
X-EA-Auth: BWypPjl/IZ0oJGnAGXPuCEI0N6yfLgIK02WGD5twTVc2z5H5akJVed4sheGrYThppklFMpDLpK10UReTcQcrzQNnqhWNwISl
Date:   Sun, 22 Jan 2023 23:48:00 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        Praveen Kumar <kumarpraveen@linux.microsoft.com>,
        Saurabh Singh Sengar <ssengar@microsoft.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: submit: No need for Null pointer check before
 kfree
Message-ID: <Y8192OxUvYg3CCaQ@ubun2204.myguest.virtualbox.org>
References: <Y6sn7XptKyk5cbrA@qemulion>
 <864f2fdd-4289-a178-bbf1-c2a6a579c58c@kapsi.fi>
 <Y6w/4IzoMFsVnCmu@qemulion>
 <280170a7-de12-f362-cda3-11208ead0a88@kapsi.fi>
 <20221230091501.GA1285371@linux.intel.com>
 <65468c84-fc40-e4e1-0adb-ddfc23ec4fb9@kapsi.fi>
 <a815b74d-c158-73b6-cfc8-583826277b5c@kapsi.fi>
 <Y7MgdKD14kLwOo0S@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y7MgdKD14kLwOo0S@qemulion>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jan 02, 2023 at 11:50:36PM +0530, Deepak R Varma wrote:
> On Fri, Dec 30, 2022 at 12:03:25PM +0200, Mikko Perttunen wrote:
> > On 12/30/22 12:01, Mikko Perttunen wrote:
> > > On 12/30/22 11:15, Stanislaw Gruszka wrote:
> > > > On Wed, Dec 28, 2022 at 03:17:59PM +0200, Mikko Perttunen wrote:
> > > > > On 12/28/22 15:08, Deepak R Varma wrote:
> > > > > > On Wed, Dec 28, 2022 at 02:28:54PM +0200, Mikko Perttunen wrote:
> > > > > > > On 12/27/22 19:14, Deepak R Varma wrote:
> > > > > > > > kfree() & vfree() internally perform NULL check on the pointer handed
> > > > > > > > to it and take no action if it indeed is NULL. Hence there is no need
> > > > > > > > for a pre-check of the memory pointer before handing it to
> > > > > > > > kfree()/vfree().
> > > > > > > >
> > > > > > > > Issue reported by ifnullfree.cocci Coccinelle semantic patch script.
> > > > > > > >
> > > > > > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > > > > > ---
> > > > > > > >     drivers/gpu/drm/tegra/submit.c | 4 ++--
> > > > > > > >     1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/tegra/submit.c
> > > > > > > > b/drivers/gpu/drm/tegra/submit.c
> > > > > > > > index 066f88564169..06f836db99d0 100644
> > > > > > > > --- a/drivers/gpu/drm/tegra/submit.c
> > > > > > > > +++ b/drivers/gpu/drm/tegra/submit.c
> > > > > > > > @@ -680,8 +680,8 @@ int
> > > > > > > > tegra_drm_ioctl_channel_submit(struct drm_device
> > > > > > > > *drm, void *data,
> > > > > > > >             kfree(job_data->used_mappings);
> > > > > > > >         }
> > > > > > > >
> > > > > > > > -    if (job_data)
> > > > > > > > -        kfree(job_data);
> > > > > > > > +    kfree(job_data);
> > > > > > > > +
> > > > > > > >     put_bo:
> > > > > > > >         gather_bo_put(&bo->base);
> > > > > > > >     unlock:
> > > > > > > > --
> > > > > > > > 2.34.1
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > > It continues to be the case that I think this transform
> > > > > > > is bad. Same applies
> > > > > > > to the host1x patch.
> > > > > >
> > > > > > Hello Mikko,
> > > > > > Thank you for responding to the patch proposal. Could you
> > > > > > please explain why is
> > > > > > this bad?
> > > > > >
> > > > > > Regards,
> > > > > > ./drv
> > > > > >
> > > > > > >
> > > > > > > Mikko
> > > > > >
> > > > > >
> > > > >
> > > > > Hi,
> > > > >
> > > > > it gets rid of visual hints on code paths indicating the
> > > > > possible liveness
> > > > > of pointer variables. I.e., after the change, whether the pointer can be
> > > > > NULL or not is more difficult to reason about locally, instead requiring
> > > > > more global reasoning which is mentally more taxing.
> > > > >
> > > > > Since C's type system doesn't help with tracking these kinds of
> > > > > things, I
> > > > > believe it is important to have these kinds of local contextual
> > > > > cues to help
> > > > > the programmer.
> > > >
> > > > I agree with your point of view. But regarding this particular patch,
> > > > at least on code base I can see, after free_job_data label job_done
> > > > can not be NULL. So patch seems to be ok, but maybe changelog need to
> > > > be different
> > > >
> > > > Regards
> > > > Stanislaw
> > >
> > > It can be NULL; see:
> > >
> > >          job->user_data = job_data;
> > >          job->release = release_job;
> > >          job->timeout = 10000;
> > >
> > >          /*
> > >           * job_data is now part of job reference counting, so don't
> > > release
> > >           * it from here.
> > >           */
> > >          job_data = NULL;
> > >
> > > If we go into free_job_data after this code (which happens if there is
> > > no error, or if host1x_job_submit fails), job_data will be NULL.
> > >
> > > The memory is instead released in the 'put_job' label; host1x_job_put
> > > ends up calling release_job, which does the kfree.
> >
> > Well, the refcount is dropped -- it's not necessarily freed immediately, if
> > the job is in execution.
> 
> Thanks Mikko. I Agree. Hence I think there is no change for the program at
> runtime. The proposed change looks safe to me.

Hello,
Requesting any further feedback/comment on this patch proposal.

Thank you,
./drv

> 
> ./drv
> 
> >
> > Mikko
> >
> > >
> > > (Yes, it is rather complicated..)
> > >
> > > Thanks,
> > > Mikko
> >


